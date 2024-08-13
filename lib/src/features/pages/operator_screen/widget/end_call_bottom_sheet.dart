import 'package:flutter/material.dart';

class EndCallBottomSheet extends StatelessWidget {
  const EndCallBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              onChanged: (value) {},
              items: const [
                DropdownMenuItem(
                  value: 'ddd',
                  child: Text('End chat'),
                ),
                DropdownMenuItem(
                  value: 'ddd',
                  child: Text('End chat'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
