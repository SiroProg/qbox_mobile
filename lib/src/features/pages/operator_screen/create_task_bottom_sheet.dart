import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/create_task_sceen.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';

class CreateTaskBottomSheet extends StatelessWidget {
  const CreateTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<ChatProvider>(
          builder: (
            BuildContext context,
            ChatProvider provider,
            Widget? child,
          ) =>
              Column(
            children: [
              AppBar(
                title: const Text('Create Task'),
                centerTitle: true,
                automaticallyImplyLeading: false,
                actions: const [CloseButton()],
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => CreateTaskScreen(
                        title: provider.folders[5].forms[0].title,
                        fieldId: provider.folders[5].forms[0].id,
                      ),
                    ),
                  );
                },
                title: Text(
                  provider.folders[5].forms[0].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => CreateTaskScreen(
                        title: provider.folders[6].forms[0].title,
                        fieldId: provider.folders[6].forms[0].id,
                      ),
                    ),
                  );
                },
                title: Text(
                  provider.folders[6].forms[0].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
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
