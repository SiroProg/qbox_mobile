import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/features/pages/home_screen/home_screen.dart';
import 'package:qbox_mobile/src/features/pages/profile_screen/profile_screen.dart';
import 'package:qbox_mobile/src/features/pages/search/search_screen.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';

class HomeProvider extends ChangeNotifier {
  List<Widget> pages = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    ProfileScreen(id: DBService.id),
  ];

  int selectedIndex = 0;

  void onItemTapped(int index, BuildContext context) {
    if (selectedIndex == index) {
      return;
    }

    selectedIndex = index;

    switch (index) {
      case 0:
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
              builder: (context) => pages[index],
            ),
            (route) => false);
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => pages[index],
          ),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => pages[index],
          ),
        );
        break;
    }

    notifyListeners();
  }
}
