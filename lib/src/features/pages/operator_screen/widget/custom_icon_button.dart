import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 45,
        height: 45,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.lightDark90.withOpacity(0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Icon(
            icon,
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
