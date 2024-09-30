import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.chat, color: Colors.blue),
      label: Text(title, style: const TextStyle(color: Colors.blue)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[50],
        side: BorderSide(color: Colors.blue[100]!, width: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size(double.infinity, 50),
        maximumSize: const Size(double.infinity, 50),
      ),
    );
  }
}
