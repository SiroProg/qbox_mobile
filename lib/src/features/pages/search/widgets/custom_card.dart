import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.photo,
    required this.title,
    required this.subtile,
    this.onTap,
    super.key,
  });

  final String photo;
  final String title;
  final String subtile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: AppColors.grey.withOpacity(0.1),
          radius: 30,
          backgroundImage: NetworkImage(photo),
          child: ClipOval(
            child: Image.network(
              photo,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: const Icon(
                    Icons.person,
                    size: 30,
                    color: AppColors.grey,
                  ),
                );
              },
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text(subtile),
      ),
    );
  }
}
