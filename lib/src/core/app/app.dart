import 'package:qbox_mobile/src/features/providers/knowledge_base_provider.dart';
import 'package:qbox_mobile/src/features/providers/serach_provider.dart';
import 'package:qbox_mobile/src/features/providers/task_provider.dart';
import '../../features/pages/authentication_screen/authentication_page.dart';
import 'package:qbox_mobile/src/features/providers/employees_provider.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import 'package:qbox_mobile/src/features/providers/home_provider.dart';
import '../../features/providers/control_panel_provider.dart';
import '../../features/providers/profile_provider.dart';
import '../../features/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => ControlPanelProvider()),
        ChangeNotifierProvider(create: (_) => EmployeesProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => KnowledgeBaseProvider()),
        ChangeNotifierProvider(create: (_) => SerachProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Qbox mobile',
        theme: ThemeData(
          primaryColor: AppColors.blue,
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.white10,
            scrolledUnderElevation: 0.1,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.white,
            selectedItemColor: AppColors.blue,
            unselectedItemColor: AppColors.grey,
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            color: Colors.transparent,
            elevation: 0,
          ),
          fontFamily: 'Oxygen',
        ),
        home: const AuthenticationPage(),
      ),
    );
  }
}
