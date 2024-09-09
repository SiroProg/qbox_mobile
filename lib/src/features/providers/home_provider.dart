// import 'package:flutter/cupertino.dart';
// import 'package:qbox_mobile/src/features/pages/home_screen/home_screen.dart';
// import 'package:qbox_mobile/src/features/pages/profile_screen/profile_screen.dart';
// import 'package:qbox_mobile/src/features/pages/search/search_screen.dart';
// import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';

// class HomeProvider extends ChangeNotifier {
//   List<Widget> pages = <Widget>[
//     const HomeScreen(),
//     const SearchScreen(),
//     ProfileScreen(id: DBService.id),
//   ];

//   int selectedIndex = 0;

//   void onItemTapped(int index, BuildContext context) {
//     if (selectedIndex == index) {
//       return;
//     }

//     selectedIndex = index;

//     switch (index) {
//       case 0:
//         Navigator.push(
//           context,
//           CupertinoPageRoute(
//             builder: (context) => pages[0],
//           ),
//         );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           CupertinoPageRoute(
//             builder: (context) => pages[1],
//           ),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           CupertinoPageRoute(
//             builder: (context) => pages[2],
//           ),
//         );
//         break;
//     }

//     notifyListeners();
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:qbox_mobile/src/features/pages/calls/calls_screen.dart';
import 'package:qbox_mobile/src/features/pages/profile_screen/profile_screen.dart';
import 'package:qbox_mobile/src/features/pages/search/search_screen.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';

class HomeProvider extends ChangeNotifier {
  PageController pageController = PageController();

  List<Widget> pages = <Widget>[
    const CallsScreen(),
    const SearchScreen(),
    ProfileScreen(id: DBService.id),
  ];

  int selectedIndex = 0;

  void onItemTapped(int index) async {
    selectedIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
    print(-9090);
    print(DBService.id);
  }

  void onPageChanged(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
