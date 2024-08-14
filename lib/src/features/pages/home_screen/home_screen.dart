import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/features/pages/employess/employees_screen.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import '../../../core/models/auth_models/employee_model.dart';
import '../../../core/styles/app_colors.dart';
import '../../providers/auth_provider.dart';
import '../../services/db_service/db_service.dart';
import '../../services/home_service/home_service.dart';
import '../../services/socket_service.dart';
import '../control_panel_screen/control_panel_screen.dart';
import '../profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Employee _employeeFuture;

  bool _isSocketInitialized = false;

  @override
  void initState() {
    super.initState();
    _loadEmployee();

    socketService.initSocket(context);
    if (!_isSocketInitialized) {
      socketService.initSocket(context);
      _isSocketInitialized = true;
    }

    final chatProvider = Provider.of<ChatProvider>(context, listen: false);

    chatProvider.initialize();
    chatProvider.setBuildContext(context);
  }

  void _loadEmployee() async {
    String token = DBService.token;
    HomeService apiService = HomeService();
    _employeeFuture = await apiService.fetchEmployee(token);
    DBService.id = _employeeFuture.id;
  }

  @override
  void dispose() {
    socketService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: () {
                authProvider.user = _employeeFuture;
                _loadEmployee();
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ProfileScreen(id: _employeeFuture.id),
                  ),
                );
              },
              color: AppColors.white,
              child: const Text(
                "Profile",
                style: TextStyle(
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              onPressed: () {
                authProvider.user = _employeeFuture;
                _loadEmployee();
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => VideoScreen(
                      employee: _employeeFuture,
                    ),
                  ),
                );
              },
              color: AppColors.white,
              child: const Text(
                "Socket",
                style: TextStyle( 
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: AppColors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const EmployeesScreen(),
                  ),
                );
              },
              child: const Text(
                'Employess',
                style: TextStyle(
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
