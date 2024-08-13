import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/models/employess/employees_model.dart';

class EmployesCard extends StatelessWidget {
  const EmployesCard({
    required this.employees,
    required this.onTap,
    super.key,
  });

  final EmployeesModel employees;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.grey.withOpacity(0.2),
        child: Text(
          '${employees.firstName[0].toUpperCase()} ${employees.lastName[0].toUpperCase()}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
      title: Text(employees.displayName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('@${employees.username}'),
          Text(employees.role.title),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: onTap,
    );
  }
}
