import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/success_dialog.dart';
import 'package:qbox_mobile/src/features/providers/task_provider.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (
        BuildContext context,
        TaskProvider provider,
        Widget? child,
      ) =>
          CupertinoAlertDialog(
        title: const Text('Attention'),
        content: const Text(
          'Вы действительно хотите удалить задачу YG69708303?',
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.green),
            ),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              bool isDeleted = true;
              Navigator.of(context).pop();
              if (isDeleted) {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => SuccessDialog(
                    message: 'Your task successfully deleted',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                );
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
