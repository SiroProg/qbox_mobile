import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/features/pages/employess/widget/custom_button.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import 'package:qbox_mobile/src/features/services/socket_service.dart';

class EndCallBottomSheet extends StatefulWidget {
  const EndCallBottomSheet({super.key});

  @override
  State<EndCallBottomSheet> createState() => _EndCallBottomSheetState();
}

class _EndCallBottomSheetState extends State<EndCallBottomSheet> {
  int? statusValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (
        BuildContext context,
        ChatProvider provider,
        Widget? child,
      ) =>
          SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Form of chat/call termination',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              const Text('This action will terminate the chat'),
              DropdownButton(
                hint: const Text('Reason for query'),
                value: statusValue,
                onChanged: (value) =>
                    setState(() => statusValue = value as int),
                items: List.generate(
                    provider.staticModel!.status.length,
                    (context) => DropdownMenuItem(
                          value: provider.staticModel!.status[context].id,
                          child:
                              Text(provider.staticModel!.status[context].title),
                        )),
              ),
              const SizedBox(height: 10),
              DropdownButton(
                hint: const Text('Тип лица'),
                value: statusValue,
                onChanged: (value) =>
                    setState(() => statusValue = value as int),
                items: List.generate(
                    provider.staticModel!.entityType.length,
                    (context) => DropdownMenuItem(
                          value: provider.staticModel!.entityType[context].id,
                          child: Text(
                              provider.staticModel!.entityType[context].title),
                        )),
              ),
              const SizedBox(height: 10),
              DropdownButton(
                hint: const Text('Есть ли вина общества'),
                value: statusValue,
                onChanged: (value) =>
                    setState(() => statusValue = value as int),
                items: List.generate(
                    provider.staticModel!.isThereAnyFaultOfSociety.length,
                    (context) => DropdownMenuItem(
                          value: provider.staticModel!
                              .isThereAnyFaultOfSociety[context].id,
                          child: Text(provider.staticModel!
                              .isThereAnyFaultOfSociety[context].title),
                        )),
              ),
              const SizedBox(height: 10),
              DropdownButton(
                hint: const Text('Вид обращения'),
                value: statusValue,
                onChanged: (value) =>
                    setState(() => statusValue = value as int),
                items: List.generate(
                    provider.staticModel!.typeOfQuery.length,
                    (context) => DropdownMenuItem(
                          value: provider.staticModel!.typeOfQuery[context].id,
                          child: Text(
                              provider.staticModel!.typeOfQuery[context].title),
                        )),
              ),
              const SizedBox(height: 40),
              CustomButton(
                onPressed: () {
                  socketService.socket.emit('message', {
                    'rtc': {'type': 'hangup'}
                  });
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                text: 'End call',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
