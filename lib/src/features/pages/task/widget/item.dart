import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final String icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.1),
                border: Border.all(color: AppColors.grey),
              ),
              child: Row(
                children: [
                  SvgPicture.string(
                    icon,
                    // ignore: deprecated_member_use
                    color: AppColors.grey,
                    width: 20,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(title),
                ],
              ),
            ),
          ),
          // Value section
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.1),
                border: Border.all(color: AppColors.grey),
              ),
              child: Text(
                value,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
