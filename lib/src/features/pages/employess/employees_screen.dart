import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/employess/widget/filter_screen.dart';
import 'package:qbox_mobile/src/features/pages/employess/widget/employes_card.dart';
import 'package:qbox_mobile/src/features/pages/profile_screen/profile_screen.dart';
import 'package:qbox_mobile/src/features/providers/employees_provider.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final provider = Provider.of<EmployeesProvider>(context, listen: false);
      provider.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmployeesProvider>(context, listen: false);
    provider.fetchData();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Employees'),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: Consumer<EmployeesProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) async => provider.search(value),
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FilterScreen(),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.grey.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(50, 55),
                      ),
                      child: const Icon(
                        Icons.filter_alt,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    provider.chipFilter.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        label: Text(provider.chipFilter[index]),
                        onDeleted: () {
                          provider.removeChip(provider.chipFilter[index]);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Row(children: [Text('      Role: ${provider.sellectedRoles}')]),
              Row(children: [Text('      Group: ${provider.sellectedGroup}')]),
              provider.filterData.data.isEmpty
                  ? const Center(child: Text('No data found'))
                  : Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: provider.filterData.data.length + 1,
                        itemBuilder: (context, index) {
                          if (index < provider.filterData.data.length) {
                            final employees = provider.filterData.data[index];
                            return EmployesCard(
                              employees: employees,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileScreen(id: employees.id),
                                  ),
                                );
                              },
                            );
                          } else {
                            return provider.isLoading
                                ? const Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1),
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
