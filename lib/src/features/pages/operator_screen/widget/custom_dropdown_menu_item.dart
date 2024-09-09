import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/models/operator_call/static_config/new_model/values_model.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';

class CustomDropdownMenuItem extends StatelessWidget {
  const CustomDropdownMenuItem({
    this.onTap,
    required this.label,
    required this.hintText,
    required this.onChanged,
    required this.items,
    required this.validator,
    this.value,
    this.isLabelStyle = false,
    super.key,
  });

  final VoidCallback? onTap;
  final String label;
  final String hintText;
  final ValueChanged<int?> onChanged;
  final List<ValuesModel> items;
  final FormFieldValidator<int?> validator;
  final int? value;
  final bool isLabelStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: DropdownButtonFormField<int>(
        onTap: onTap,
        dropdownColor: AppColors.white,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.grey, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.grey, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.grey, width: 1),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black, width: 1),
          ),
          hintText: hintText,
          labelStyle:
              isLabelStyle ? const TextStyle(color: AppColors.black) : null,
          fillColor: AppColors.white,
          filled: true,
          label: Text(
            label,
            style: const TextStyle(
              color: AppColors.grey,
            ),
          ),
        ),
        value: value,
        onChanged: onChanged,
        validator: validator, // Set validator
        items: items.map((ValuesModel item) {
          return DropdownMenuItem<int>(
            value: item.id,
            child: Text(item.title),
          );
        }).toList(),
      ),
    );
  }
}
