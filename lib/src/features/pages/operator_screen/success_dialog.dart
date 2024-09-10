import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

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
      content: const Text(
        'Your task was successfully created.',
        style: TextStyle(fontSize: 16),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
