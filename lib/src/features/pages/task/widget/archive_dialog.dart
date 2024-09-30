import 'package:flutter/cupertino.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';

class ArchiveDialog extends StatelessWidget {
  const ArchiveDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Attention'),
      content: const Text(
        'Архивировать задачу?',
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Yes',
            style: TextStyle(color: AppColors.green),
          ),
        ),
      ],
    );
  }
}
