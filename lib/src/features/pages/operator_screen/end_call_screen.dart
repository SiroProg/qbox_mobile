import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import 'package:qbox_mobile/src/features/pages/employess/widget/custom_button.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/widget/custom_dropdown_menu_item.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/widget/end_call_bottom_sheet.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';

class EndCallScreen extends StatefulWidget {
  const EndCallScreen({super.key});

  @override
  State<EndCallScreen> createState() => _EndCallScreenState();
}

class _EndCallScreenState extends State<EndCallScreen> {
  final _formKey = GlobalKey<FormState>();
  // int? _selectedValue;
  final TextEditingController _commentController = TextEditingController();

  void _submitForm() {
    final provider = Provider.of<ChatProvider>(context, listen: false);

    if (_formKey.currentState?.validate() ?? false) {
      warning('Form is valid and ready for submission');
      provider.hangUp();
      provider.taskTypeTitle = '';
      Navigator.pop(context);
      Navigator.pop(context);
    } else {
      info('Form is not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (
        BuildContext context,
        ChatProvider provider,
        Widget? child,
      ) =>
          Scaffold(
        appBar: AppBar(title: const Text('End Call Screen')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.white,
                        builder: (context) => const EndCallBottomSheet(),
                      );
                    },
                    child: CustomDropdownMenuItem(
                      label: provider.taskTypeTitle.isEmpty
                          ? 'Reason for query *'
                          : provider.taskTypeTitle,
                      hintText: 'Please select an option',
                      onChanged: (value) {},
                      items: const [],
                      isLabelStyle: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                      value: provider.taskTypeTitle.isEmpty ? null : 0,
                    ),
                  ),
                  CustomDropdownMenuItem(
                    label: 'Статус',
                    hintText: 'Please select an option',
                    onChanged: (value) {
                      provider.endCallModel.nonresidentVerificationStatus =
                          value;
                    },
                    items: List.generate(
                      provider.staticModel!.status.length,
                      (index) => provider.staticModel!.status[index],
                    ),
                    validator: (value) => null,
                    value: provider.endCallModel.nonresidentVerificationStatus,
                  ),
                  CustomDropdownMenuItem(
                    label: 'Вид обращения',
                    hintText: 'Please select an option',
                    onChanged: (value) {
                      provider.endCallModel.userTreatmentType = value;
                    },
                    items: List.generate(
                      provider.staticModel!.typeOfQuery.length,
                      (index) => provider.staticModel!.typeOfQuery[index],
                    ),
                    validator: (value) => null,
                    value: provider.endCallModel.userTreatmentType,
                  ),
                  CustomDropdownMenuItem(
                    label: 'Есть ли вина Общества',
                    hintText: 'Please select an option',
                    onChanged: (value) {
                      provider.endCallModel.userPostMistake = value;
                    },
                    items: List.generate(
                      provider.staticModel!.isThereAnyFaultOfSociety.length,
                      (index) =>
                          provider.staticModel!.isThereAnyFaultOfSociety[index],
                    ),
                    validator: (value) => null,
                    value: provider.endCallModel.userPostMistake,
                  ),
                  CustomDropdownMenuItem(
                    label: 'Тип лица',
                    hintText: 'Please select an option',
                    onChanged: (value) {
                      provider.endCallModel.userClientType = value;
                    },
                    items: List.generate(
                      provider.staticModel!.entityType.length,
                      (index) => provider.staticModel!.entityType[index],
                    ),
                    validator: (value) => null,
                    value: provider.endCallModel.userClientType,
                  ),
                  TextFormField(
                    controller: _commentController,
                    onChanged: (value) {
                      provider.endCallModel.comment = value;
                    },
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: AppColors.grey),
                      labelText: 'Comment',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a comment';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 80),
                  CustomButton(onPressed: _submitForm, text: "Заверишить"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
