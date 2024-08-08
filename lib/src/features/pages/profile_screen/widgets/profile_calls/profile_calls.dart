import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Тип звонка",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(
                      color: AppColors.lightDark85,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      children:
                          List.generate(widget.calls.callTypes.length, (value) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CallTypeItem(
                            callType: widget.calls.callTypes[value],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Очереди",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  for (QueueModel queue in widget.calls.queues ?? [])
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Chip(
                        label: Text(queue.titleRu ?? 's'),
                        backgroundColor: AppColors.white,
                      ),
                    ),
                ],
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
  const CallTypeItem({super.key, required this.callType});

  (String text, IconData icon) getCallType() {
    switch (callType) {
      case 'audio':
        return ('Аудиозвонок', CupertinoIcons.headphones);
      case 'video':
        return ('Видеозвонок', CupertinoIcons.video_camera);
      case 'text':
        return ('Текстовый чат', CupertinoIcons.chat_bubble);
      default:
        return ('Неизвестно', CupertinoIcons.question);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          getCallType().$2,
          color: AppColors.black,
          size: 25,
        ),
        SizedBox(width: 20),
        Text(
          getCallType().$1,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
