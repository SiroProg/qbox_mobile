import 'package:flutter/cupertino.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_images.dart';


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(AppImages.appLogo),
              ),
            ),
          ),
        ),
        Text(
          "AI box",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 40,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
