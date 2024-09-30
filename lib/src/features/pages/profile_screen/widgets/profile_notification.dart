import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/styles/app_svg.dart';
import 'package:qbox_mobile/src/features/providers/profile_provider.dart';

class ProfileNotification extends StatefulWidget {
  const ProfileNotification({super.key});

  @override
  State<ProfileNotification> createState() => _ProfileNotificationState();
}

class _ProfileNotificationState extends State<ProfileNotification> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.lightDark95,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'Уведомления',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
        leading: BackButton(
          style: ButtonStyle(iconSize: WidgetStateProperty.all(20)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
                child: Text(
                  'Настройка схемы',
                  style: TextStyle(
                    color: AppColors.black10,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            child: Radio(
                              fillColor: WidgetStateProperty.all(
                                AppColors.black10,
                              ),
                              value: 1,
                              onChanged: (Object? value) {},
                              groupValue: profileProvider.schemeSelection,
                            ),
                            scale: 0.8,
                          ),
                          Text(
                            'Минимальная схема',
                            style: TextStyle(
                              color: AppColors.black10,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Radio(
                              fillColor: WidgetStateProperty.all(
                                AppColors.black10,
                              ),
                              value: 2,
                              onChanged: (Object? value) {},
                              groupValue: profileProvider.schemeSelection,
                            ),
                          ),
                          Text(
                            'Стандартная схема',
                            style: TextStyle(
                              color: AppColors.black10,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Radio(
                              fillColor: WidgetStateProperty.all(
                                AppColors.black10,
                              ),
                              value: 3,
                              onChanged: (Object? value) {},
                              groupValue: profileProvider.schemeSelection,
                            ),
                          ),
                          Text(
                            'Максимальная схема',
                            style: TextStyle(
                              color: AppColors.black10,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.string(
                          AppSvg.bell,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Всплывающее уведомление',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            activeColor: AppColors.blue,
                            thumbColor:
                                WidgetStateProperty.all(AppColors.white),
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.string(
                          AppSvg.plain,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Telegram',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            trackOutlineColor:
                                WidgetStateProperty.all(AppColors.white),
                            activeColor: AppColors.blue,
                            inactiveThumbColor: AppColors.white,
                            inactiveTrackColor: AppColors.lightDark90,
                            thumbColor:
                                WidgetStateProperty.all(AppColors.white),
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.string(
                          AppSvg.email,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Эл. почта',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            activeColor: AppColors.blue,
                            thumbColor:
                                WidgetStateProperty.all(AppColors.white),
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.string(
                          AppSvg.language,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Мультиязычность',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            trackOutlineColor:
                                WidgetStateProperty.all(AppColors.white),
                            activeColor: AppColors.blue,
                            inactiveThumbColor: AppColors.white,
                            inactiveTrackColor: AppColors.lightDark90,
                            thumbColor:
                                WidgetStateProperty.all(AppColors.white),
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
