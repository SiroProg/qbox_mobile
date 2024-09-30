import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/search/widgets/customers_screen.dart';
import 'package:qbox_mobile/src/features/pages/search/widgets/tasks_screen.dart';
import 'package:qbox_mobile/src/features/pages/search/widgets/users_screen.dart';
import 'package:qbox_mobile/src/features/providers/serach_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  final controller = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<SerachProvider>(
          builder: (
            BuildContext context,
            SerachProvider provider,
            Widget? child,
          ) =>
              Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                child: SearchBar(
                  onChanged: (value) => provider.serarch(value),
                  controller: controller,
                  leading: const Icon(Icons.search),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.white),
                  trailing: [
                    IconButton(
                      onPressed: () {
                        controller.clear();
                        provider.serarch(null);
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              TabBar(
                controller: _tabController,
                indicatorColor: AppColors.blue,
                overlayColor: WidgetStatePropertyAll(
                  AppColors.blue.withOpacity(0.2),
                ),
                labelColor: AppColors.blue,
                tabs: [
                  _buildTab('Task', provider.tasks.length),
                  _buildTab('User', provider.users.length),
                  _buildTab('Customer', provider.customers.length),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    TaskScreenItem(),
                    UsersScreen(),
                    CustomersScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, int count) {
    return SizedBox(
      width: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label),
          if (count > 0)
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              width: 20,
              height: 20,
              child: Center(
                child: Text(
                  "$count",
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
