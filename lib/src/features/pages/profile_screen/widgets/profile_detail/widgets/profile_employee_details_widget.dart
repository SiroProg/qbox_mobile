import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/models/profile_models/employee_by_id_model.dart';
import '../../../../../../core/models/profile_models/position_model.dart';
import '../../../../../../core/models/profile_models/skill_model.dart';
import '../../../../../../core/styles/app_colors.dart'; // Import Material for CircularProgressIndicator

class ProfileEmployeeDetailsWidget extends StatelessWidget {
  final List<SkillModel> skills;
  final EmployeeByIdModel employee;
  final PositionModel position;

  const ProfileEmployeeDetailsWidget({
    super.key,
    required this.employee,
    required this.skills,
    required this.position,
  });

  String getSkills() {
    String result = '';
    for (SkillModel skill in skills) {
      result += skill.titleRu;
      result += ', ';
    }
    return result;
  }

  String determineGender(int value) {
    if (value == 0) {
      return 'Мужской';
    } else if (value == 1) {
      return 'Женский';
    } else {
      return 'Не указан';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Данные сотрудника",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 10),
          _buildEmployeeDetails(), // Show employee details
          const SizedBox(height: 10),
          const Text(
            "Системные данные",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 10),
          _buildSystemDetails(), // Show system details
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildEmployeeDetails() {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.lightDark85,
            width: 1,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                EmployeeDetailItem(
                  title: "ID",
                  value: employee.id.toString(),
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Логин",
                  value: '@${employee.username ?? ""}',
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Имя",
                  value: employee.firstName ?? "",
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Фамилия",
                  value: employee.lastName ?? "",
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Отчество",
                  value: employee.patronymic ?? "",
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Пол",
                  value: determineGender(employee.sex ?? -1),
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "ИИН",
                  value: employee.iin ?? "",
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Управление",
                  value: employee.management.toString(),
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Должность",
                  value: employee.position.toString(),
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Создано",
                  value: employee.createdBy?.displayName ?? "",
                ),
                EmployeeDetailItem(
                  title: "",
                  value: (employee.createdAt != null
                      ? " ${DateTime.fromMillisecondsSinceEpoch(employee.createdAt! * 1000).toString()}"
                      : ""),
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Часовой пояс",
                  value: employee.timezone ?? "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSystemDetails() {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.lightDark85,
            width: 1,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                EmployeeDetailItem(
                  title: "Роль",
                  value: employee.role?.title ?? "",
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Группа",
                  value: employee.group?.title ?? "",
                ),
                const SizedBox(height: 10),
                const EmployeeDetailItem(
                  title: "Язык",
                  value: "Русский",
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Внешний ID",
                  value: employee.externalId ?? "Не указано",
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Роль в группе",
                  value: position.titleRu,
                ),
                const SizedBox(height: 10),
                EmployeeDetailItem(
                  title: "Навыки",
                  value: getSkills(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeeDetailItem extends StatelessWidget {
  final String title;
  final String value;

  const EmployeeDetailItem({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.black10,
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 220, // Adjust width as per your design requirements
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
