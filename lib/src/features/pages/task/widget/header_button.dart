import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/styles/app_svg.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        tileColor: AppColors.grey.withOpacity(0.1),
        onTap: onTap,
        title: const Text(
          'Новый',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Новый'),
        leading: SizedBox(
          width: 50,
          height: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                width: 1,
                color: AppColors.grey.withOpacity(0.2),
              ),
            ),
            child: SvgPicture.string(
              AppSvg.image,
              // ignore: deprecated_member_use
              color: AppColors.grey,
              width: 10,
              height: 10,
            ),
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}
