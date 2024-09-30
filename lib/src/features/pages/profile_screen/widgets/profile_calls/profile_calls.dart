import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qbox_mobile/src/core/styles/app_svg.dart';
import '../../../../../core/models/profile_models/calls_model.dart';
import '../../../../../core/models/profile_models/queues_model.dart';
import '../../../../../core/styles/app_colors.dart';

class ProfileCalls extends StatefulWidget {
  final CallsModel calls;
  const ProfileCalls({super.key, required this.calls});

  @override
  State<ProfileCalls> createState() => _ProfileCallsState();
}

class _ProfileCallsState extends State<ProfileCalls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightDark95,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'Звонки',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: const Text(
                  "Тип звонка",
                  style: TextStyle(
                    color: AppColors.black10,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: AppColors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: List.generate(
                          widget.calls.callTypes?.length ?? 0, (value) {
                        return CallTypeItem(
                          callType: widget.calls.callTypes?[value] ?? '',
                        );
                      }),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 5),
                child: const Text(
                  "Очереди",
                  style: TextStyle(
                    color: AppColors.black10,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: AppColors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Wrap(
                      children: [
                        for (QueueModel queue in widget.calls.queues ?? [])
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Chip(
                              side: BorderSide(color: AppColors.lightDark85),
                              label: Text(
                                queue.titleRu ?? '',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              backgroundColor: AppColors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 5, bottom: 5),
                child: const Text(
                  "Автоответ",
                  style: TextStyle(
                    color: AppColors.black10,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Автоответ',
                              style: TextStyle(
                                color: AppColors.black10,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Не присвоен',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w100,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Автоответ по времени',
                              style: TextStyle(
                                color: AppColors.black10,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Не присвоен',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w100,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 5, bottom: 5),
                child: const Text(
                  "Дополнительные опции",
                  style: TextStyle(
                    color: AppColors.black10,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.string(
                          AppSvg.videoCamera,
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Показывать видео клиенту',
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
                            trackOutlineColor:
                                WidgetStateProperty.all(AppColors.white),
                            activeColor: AppColors.blue,
                            inactiveThumbColor: AppColors.white,
                            inactiveTrackColor: AppColors.lightDark90,
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
                          AppSvg.document,
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Операции по картам',
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
                            trackOutlineColor:
                                WidgetStateProperty.all(AppColors.white),
                            activeColor: AppColors.blue,
                            inactiveThumbColor: AppColors.white,
                            inactiveTrackColor: AppColors.lightDark90,
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
                          AppSvg.infoIcon,
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Операции с БМГ',
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
            ],
          ),
        ),
      ),
    );
  }
}

class CallTypeItem extends StatelessWidget {
  final String callType;
  const CallTypeItem({
    super.key,
    required this.callType,
  });

  (String text, SvgPicture icon) getCallType() {
    switch (callType) {
      case 'audio':
        return (
          'Аудиозвонок',
          SvgPicture.string(
            AppSvg.headphones,
            width: 20,
            height: 20,
          )
        );
      case 'video':
        return (
          'Видеозвонок',
          SvgPicture.string(
            AppSvg.videoCamera,
            width: 20,
            height: 20,
          )
        );
      case 'text':
        return (
          'Текстовый чат',
          SvgPicture.string(
            AppSvg.chat,
            width: 20,
            height: 20,
          )
        );
      default:
        return (
          'Неизвестно',
          SvgPicture.string(
            AppSvg.headphones,
            width: 20,
            height: 20,
          )
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getCallType().$2,
        const SizedBox(width: 15),
        Text(
          getCallType().$1,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        Transform.scale(
          scale: 0.6,
          child: Switch(
            trackOutlineColor: WidgetStateProperty.all(AppColors.white),
            activeColor: AppColors.blue,
            inactiveThumbColor: AppColors.white,
            inactiveTrackColor: AppColors.lightDark90,
            thumbColor: WidgetStateProperty.all(AppColors.white),
            value: true,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
