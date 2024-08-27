import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/features/providers/home_provider.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) => Consumer<HomeProvider>(
        builder: (
          BuildContext context,
          HomeProvider provider,
          Widget? child,
        ) =>
            BottomNavigationBar(
          currentIndex: provider.selectedIndex,
          onTap: (index) => provider.onItemTapped(index, context),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      );
}
