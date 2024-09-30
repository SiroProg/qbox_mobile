import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/task/widget/archive_dialog.dart';
import 'package:qbox_mobile/src/features/pages/task/widget/custom_bottom_sheet.dart';
import 'package:qbox_mobile/src/features/pages/task/widget/delete_dialog.dart';

class MenuBottomSheet extends StatelessWidget {
  const MenuBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      children: [
        Btn(
          title: 'Redirect',
          color: AppColors.blue,
          onTap: () {},
          side: Colors.blue[100]!,
          backgroundColor: Colors.blue[50],
        ),
        Btn(
          title: 'Archive',
          color: Colors.orange,
          onTap: () {
            Navigator.pop(context);
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => const ArchiveDialog(),
            );
          },
          side: Colors.orange[100]!,
          backgroundColor: Colors.orange[50],
        ),
        Btn(
          title: 'Delete',
          color: AppColors.red,
          onTap: () {
            Navigator.pop(context);
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => const DeleteDialog(),
            );
          },
          side: Colors.red[100]!,
          backgroundColor: Colors.red[50],
        ),
      ],
    );
  }
}

class Btn extends StatelessWidget {
  const Btn({
    required this.title,
    required this.color,
    required this.onTap,
    required this.side,
    required this.backgroundColor,
    super.key,
  });

  final String title;
  final Color? color;
  final Color side;
  final Color? backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: onTap,
        label: Text(title, style: TextStyle(color: color)),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(color: side, width: 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(300, 50),
          maximumSize: const Size(300, 50),
        ),
      ),
    );
  }
}
