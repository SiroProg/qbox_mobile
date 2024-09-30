import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/models/operator_call/redirect_models/redirect_model.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/employess/widget/custom_button.dart';
import 'package:qbox_mobile/src/features/pages/knowledge_base/knowledge_base_screen.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/create_task_bottom_sheet.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import 'package:qbox_mobile/src/features/services/socket_service.dart';

import '../../../core/models/control_panel_models/call_operator_model.dart';
import '../../providers/control_panel_provider.dart';
import '../../services/operator_call_service/operator_api_service.dart';
// >>>>>>> 96f85c4d07bffb68f82cf164ddbd41303f846faf

class MenuBottomSheet extends StatelessWidget {
  const MenuBottomSheet({super.key});

  void getOperator(int operatorId, ChatProvider chatProvider) async {
    RedirectModel operator =
        await OperatorService.getRedirectDetails(operatorId);
    chatProvider.redirectOperator = operator;
  }

  @override
  Widget build(BuildContext context) {
    final panelProvider = Provider.of<ControlPanelProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const KnowledgeBaseScreen(),
                  ),
                );
              },
              text: 'База знаний',
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.white,
                  builder: (context) => const CreateTaskBottomSheet(),
                );
              },
              text: 'Создать задачу',
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Отмена',
                        style: TextStyle(color: AppColors.black, fontSize: 16),
                      ),
                    ),
                    title: const Text(
                      'Выберите оператора',
                      style: TextStyle(color: AppColors.black, fontSize: 16),
                    ),
                    actions: [
                      ...List.generate(panelProvider.callOperators.length,
                          (index) {
                        final CallOperatorModel callOperator =
                            panelProvider.callOperators[index];
                        return CupertinoActionSheetAction(
                          onPressed: () {
                            print(callOperator.id);
                            getOperator(callOperator.id, chatProvider);
                            Future.delayed(const Duration(seconds: 2), () {
                              return socketService.redirectOperator(
                                toOperator:
                                    chatProvider.redirectOperator.address,
                                targetOperator:
                                    chatProvider.redirectOperator.address,
                                chatId: chatProvider.chatId!,
                              );
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            callOperator.fullName,
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }),
                      ...List.generate(panelProvider.callTeams.video!.length,
                          (index) {
                        final callTeam = panelProvider.callTeams.video![index];
                        return CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            callTeam.title,
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                );
              },
              text: 'Перенаправление звонка',
            ),
          ],
        ),
      ),
    );
  }
}
