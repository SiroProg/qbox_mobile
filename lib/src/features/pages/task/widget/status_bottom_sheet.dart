import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/styles/app_svg.dart';
import 'package:qbox_mobile/src/features/providers/task_provider.dart';
import 'custom_bottom_sheet.dart'; // Import your CustomBottomSheet

class StatusBottomSheet extends StatelessWidget {
  const StatusBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (BuildContext context, TaskProvider provider, Widget? child) {
        return CustomBottomSheet(
          children: provider.stattus.map((status) {
            return StatusItem(
              title: status.title,
              backgroundColor: status.color.withOpacity(0.2),
              textColor: status.color,
              onTap: () {
                provider.sellectStatuc(status.title);
                Navigator.pop(context);
              },
              status: status.value,
            );
          }).toList(),
        );
      },
    );
  }
}

class StatusItem extends StatelessWidget {
  const StatusItem({
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    required this.status,
    super.key,
  });

  final String title;
  final String status;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: AppColors.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: SvgPicture.string(
                      AppSvg.image,
                      color: AppColors.grey,
                      width: 20,
                      height: 30,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(color: textColor),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
