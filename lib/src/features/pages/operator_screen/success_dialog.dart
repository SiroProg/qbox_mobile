import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    required this.message,
    required this.onTap,
    super.key,
  });

  final String message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Column(
        children: [
          Icon(
            CupertinoIcons.check_mark_circled_solid,
            color: Colors.green,
            size: 50,
          ),
          SizedBox(height: 10),
          Text(
            'Success!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ],
      ),
      content: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: onTap,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
