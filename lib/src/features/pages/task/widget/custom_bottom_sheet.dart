import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final List<Widget> children;

  const CustomBottomSheet({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 16, top: 5),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          ...children,
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
