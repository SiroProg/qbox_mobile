import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/styles/app_images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Image.asset(
          AppImages.appLogo,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        PopupMenuButton<String>(
          color: AppColors.white,
          itemBuilder: (context) => [
            const PopupMenuItem<String>(
              value: 'Profile',
              child: Text('Profile'),
            ),
            const PopupMenuItem<String>(
              value: 'Notifications',
              child: Text('Notifications'),
            ),
            const PopupMenuItem<String>(
              value: 'Settings',
              child: Text('Settings'),
            ),
            const PopupMenuItem<String>(
              value: 'Logout',
              child: Text('Logout'),
            ),
          ],
          onSelected: _handleMenuSelection,
        ),
      ],
    );
  }

  void _handleMenuSelection(String value) {
    switch (value) {
      case 'Profile':
        // Handle Profile action

        break;
      case 'Notifications':
        // Handle Notifications action
        break;
      case 'Settings':
        // Handle Settings action
        break;
      case 'Logout':
        // Handle Logout action
        break;
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
