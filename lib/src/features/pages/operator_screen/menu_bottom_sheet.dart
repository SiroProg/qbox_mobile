import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/employess/widget/custom_button.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/create_task_bottom_sheet.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/knowledge_base_screen.dart';

class MenuBottomSheet extends StatelessWidget {
  const MenuBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
            CustomButton(onPressed: () {}, text: 'Перенаправление звонка'),
          ],
        ),
      ),
    );
  }
}
