import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qbox_mobile/src/core/models/operator_call/fields/task_data_model.dart';
import 'package:qbox_mobile/src/features/services/operator_call_service/operator_api_service.dart';
import 'package:qbox_mobile/src/core/models/operator_call/fields/card_item_model.dart';
import 'package:qbox_mobile/src/features/pages/employess/widget/custom_button.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import '../../../core/models/operator_call/fields/fields_model.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'success_dialog.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({
    required this.title,
    required this.fieldId,
    super.key,
  });

  final String title;
  final int fieldId;

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  List<FormFieldModel> formFields = [];
  Map<String, String?> selectedValues = {};
  Map<String, List<CardItemModel>> cardItemsMap = {};
  final Map<int, TextEditingController> controllers = {};
  Map<int, bool> formFieldErrors = {};
  bool isFormValid = true;

  @override
  void initState() {
    super.initState();
    _fetchFormFields();
  }

  Future<void> _fetchFormFields() async {
    formFields = await OperatorService.getFieldsById(widget.fieldId);
    for (var field in formFields) {
      controllers[field.id] = TextEditingController(
        text: _getAutoFillValue(field),
      );
      if (field.type == 'text') {
        field.value = _getAutoFillValue(field);
      } else if (field.type == 'select') {
        field.value = [];
      }
    }
    setState(() {});
  }

  Future<void> _fetchCardItem(String key) async {
    final items = await OperatorService.getCardItem(key);
    if (mounted) {
      setState(() {
        cardItemsMap[key] = items;
      });
    }
  }

  String? _getAutoFillValue(FormFieldModel field) {
    final provider = context.read<ChatProvider>();
    switch (field.autofill?.qualifier) {
      case 'user.full_name':
        return '${provider.callUserModel?.firstName} ${provider.callUserModel?.lastName}';
      case 'user.phone':
        return provider.callUserModel?.phone;
      case 'user.iin':
        return provider.callUserModel?.iin;
      case 'user.email':
        return provider.callUserModel?.email;
      default:
        return null;
    }
  }

  void _onTextChanged(
    String value,
    FormFieldModel field,
    ChatProvider provider,
  ) {
    switch (field.autofill?.qualifier) {
      case 'user.full_name':
        List<String> names = value.split(' ');
        provider.callUserModel?.firstName = names.isNotEmpty ? names[0] : '';
        provider.callUserModel?.lastName = names.length > 1 ? names[1] : '';
        field.value = value;
        break;
      case 'user.phone':
        field.value = value;
        provider.callUserModel?.phone = value;
        break;
      case 'user.iin':
        field.value = value;
        provider.callUserModel?.iin = value;
        break;
      case 'user.email':
        field.value = value;
        provider.callUserModel?.email = value;
        break;
      default:
        break;
    }
  }

  bool _validateForm() {
    bool isValid = true;
    formFieldErrors.clear();

    for (var field in formFields) {
      if (field.required) {
        if (field.value == null ||
            (field.value is String && field.value.toString().trim().isEmpty) ||
            (field.value is List && (field.value as List).isEmpty)) {
          isValid = false;
          formFieldErrors[field.id] = true;
        } else {
          formFieldErrors[field.id] = false;
        }
      }
    }

    setState(() {});
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChatProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: formFields.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: formFields.length,
                      itemBuilder: (context, index) {
                        final field = formFields[index];

                        if (field.type == 'text') {
                          return CustomInput(
                            controller: controllers[field.id]!,
                            label: field.prompt ?? '',
                            onChanged: (value) =>
                                _onTextChanged(value, field, provider),
                            isPhoneNumber: field.autofill?.qualifier ==
                                'user.phone', // Telefon raqamlar uchun
                          );
                        } else if (field.type == 'select') {
                          if (field.configs?.key != null &&
                              !cardItemsMap.containsKey(field.configs!.key!)) {
                            _fetchCardItem(field.configs!.key!);
                          }

                          final items =
                              cardItemsMap[field.configs?.key ?? ''] ?? [];

                          return DropdownButtonFormField<String>(
                            dropdownColor: AppColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            value: selectedValues['${field.id}'],
                            decoration: InputDecoration(
                              labelText: field.prompt ?? '',
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              errorText: formFieldErrors[field.id] == true
                                  ? 'Please select a value'
                                  : null,
                              errorBorder: formFieldErrors[field.id] == true
                                  ? const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    )
                                  : null,
                              focusedErrorBorder: formFieldErrors[field.id] ==
                                      true
                                  ? const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    )
                                  : null,
                            ),
                            items: items.map((CardItemModel item) {
                              return DropdownMenuItem<String>(
                                value: '${item.id}',
                                child: Text(item.title),
                              );
                            }).toList(),
                            onChanged: (value) {
                              field.value = [int.tryParse(value ?? '')];
                              selectedValues['${field.id}'] = value;
                            },
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  CustomButton(
                    onPressed: () async {
                      if (_validateForm()) {
                        info(formFields);

                        final TaskDataModel data = TaskDataModel(
                          formData: formFields,
                          formId: widget.fieldId,
                          sender: provider.callUserModel!.userId,
                        );
                        bool isCreated = await OperatorService.createTask(data);
                        if (isCreated && context.mounted) {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const SuccessDialog();
                            },
                          );
                        }
                      }
                    },
                    text: 'Create Task',
                  ),
                  const SizedBox(height: 10),
                ],
              ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({
    required this.controller,
    required this.label,
    required this.onChanged,
    this.isTypeNumber = false,
    this.isPhoneNumber = false,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final void Function(String)? onChanged;
  final bool isTypeNumber;
  final bool isPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: AppColors.blue,
        cursorHeight: 20,
        keyboardType: isPhoneNumber || isTypeNumber
            ? TextInputType.number
            : TextInputType.text,
        inputFormatters: isTypeNumber
            ? [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11)
              ]
            : isPhoneNumber
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11)
                  ]
                : null,
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(color: AppColors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blue,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:qbox_mobile/src/core/styles/app_colors.dart';
// import 'package:qbox_mobile/src/features/pages/employess/widget/custom_button.dart';
// import 'package:qbox_mobile/src/features/providers/chat_provider.dart';

// class CreateTaskScreen extends StatefulWidget {
//   const CreateTaskScreen({required this.title, super.key});

//   final String title;

//   @override
//   State<CreateTaskScreen> createState() => _CreateTaskScreenState();
// }

// class _CreateTaskScreenState extends State<CreateTaskScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ChatProvider>(
//       builder: (
//         BuildContext context,
//         ChatProvider provider,
//         Widget? child,
//       ) =>
//           Scaffold(
//         appBar: AppBar(
//           title: const Text('Create task'),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 50,
//                   width: double.infinity,
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(12),
//                       ),
//                       border: Border.all(width: 1, color: AppColors.black),
//                     ),
//                     child: Center(
//                       child: Text(
//                         widget.title,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 CustomInput(
//                   controller: TextEditingController(
//                     text:
//                         '${provider.callUserModel!.lastName} ${provider.callUserModel!.firstName}',
//                   ),
//                   label: 'Full name',
//                   onChanged: (value) {},
//                 ),
//                 CustomInput(
//                   controller:
//                       TextEditingController(text: provider.callUserModel!.iin),
//                   label: 'IIN',
//                   isTypeNumber: true,
//                   onChanged: (value) {},
//                 ),
//                 CustomInput(
//                   controller: TextEditingController(text: ''),
//                   label: 'Email',
//                   onChanged: (value) {},
//                 ),
//                 CustomInput(
//                   controller: TextEditingController(
//                     text: provider.callUserModel!.phone,
//                   ),
//                   label: 'Номер заявителя',
//                   isPhoneNumber: true,
//                   onChanged: (value) {},
//                 ),
//                 const SizedBox(height: 20),
//                 CustomButton(onPressed: () {}, text: 'Create Task'),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomInput extends StatelessWidget {
//   const CustomInput({
//     required this.controller,
//     required this.label,
//     required this.onChanged,
//     this.isTypeNumber = false,
//     this.isPhoneNumber = false,
//     super.key,
//   });

//   final TextEditingController controller;
//   final String label;
//   final void Function(String)? onChanged;
//   final bool isTypeNumber;
//   final bool isPhoneNumber;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: TextField(
//         controller: controller,
//         onChanged: onChanged,
//         cursorColor: AppColors.blue,
//         cursorHeight: 20,
//         keyboardType: isPhoneNumber || isTypeNumber
//             ? TextInputType.number
//             : TextInputType.text,
//         inputFormatters: isTypeNumber
//             ? [
//                 FilteringTextInputFormatter.digitsOnly,
//                 LengthLimitingTextInputFormatter(12)
//               ]
//             : isPhoneNumber
//                 ? [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(11)
//                   ]
//                 : null,
//         decoration: InputDecoration(
//           label: Text(
//             label,
//             style: const TextStyle(color: AppColors.grey),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: AppColors.blue,
//             ),
//             borderRadius: BorderRadius.all(
//               Radius.circular(10),
//             ),
//           ),
//           border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
