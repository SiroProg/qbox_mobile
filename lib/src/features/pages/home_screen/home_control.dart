// import 'package:flutter/material.dart';
// import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_app_bar.dart';
// import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_bottom_navigation.dart';
// import 'package:provider/provider.dart';
// import 'package:qbox_mobile/src/features/providers/home_provider.dart';
// import 'package:qbox_mobile/src/features/services/socket_service.dart';

// class HomeControl extends StatefulWidget {
//   const HomeControl({super.key});

//   @override
//   State<HomeControl> createState() => _HomeControlState();
// }

// class _HomeControlState extends State<HomeControl> {
//   @override
//   void initState() {
//     super.initState();
//     socketService.initSocket(context);
//   }

//   @override
//   void dispose() {
//     socketService.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Consumer<HomeProvider>(
//         builder: (context, provider, child) => Scaffold(
//           appBar: const CustomAppBar(),
//           body: provider.pages[provider.selectedIndex],
//           bottomNavigationBar: const CustomBottomNavigation(),
//         ),
//       );
// }

import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/models/auth_models/employee_model.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/features/providers/home_provider.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';
import 'package:qbox_mobile/src/features/services/home_service/home_service.dart';
import 'package:qbox_mobile/src/features/services/socket_service.dart';

class HomeControl extends StatefulWidget {
  const HomeControl({super.key});

  @override
  State<HomeControl> createState() => _HomeControlState();
}

class _HomeControlState extends State<HomeControl> {
  late Employee _employeeFuture;

  void _loadEmployee() async {
    _employeeFuture = await HomeService.fetchEmployee(DBService.token);
    DBService.id = _employeeFuture.id;
  }

  @override
  void initState() {
    super.initState();
    _loadEmployee();
    socketService.initSocket(context);
  }

  @override
  void dispose() {
    socketService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Consumer<HomeProvider>(
          builder: (context, provider, child) => PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: provider.pageController,
            onPageChanged: provider.onPageChanged,
            children: provider.pages,
          ),
        ),
      );
}

// class Base extends StatelessWidget {
//   final Widget child;

//   const Base({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: const CustomAppBar(),
//       // bottomNavigationBar: const CustomBottomNavigation(),
//       body: child,
//     );
//   }
// }



