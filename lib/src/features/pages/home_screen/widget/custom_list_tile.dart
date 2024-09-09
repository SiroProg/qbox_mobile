import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey.withOpacity(0.2)),
          color: AppColors.grey.withOpacity(0.1),
        ),
        child: ListTile(
          onTap: () => onTap(),
          contentPadding: const EdgeInsets.all(8.0),
          leading: Icon(icon, color: AppColors.grey),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              height: 2,
            ),
          ),
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle!,
                  style: const TextStyle(
                    height: 1.2,
                    fontSize: 10,
                    color: AppColors.grey,
                  ),
                ),
        ),
      ),
    );
  }
}
