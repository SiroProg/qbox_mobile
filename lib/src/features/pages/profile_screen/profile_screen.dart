import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import 'package:qbox_mobile/src/features/services/profile_service/profile_service.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/models/profile_models/calls_model.dart';
import '../../../core/models/profile_models/employee_by_id_model.dart';
import '../../../core/models/profile_models/position_model.dart';
import '../../../core/models/profile_models/skill_model.dart';
import '../../../core/styles/app_colors.dart';
import 'widgets/profile_calls/profile_calls.dart';
import 'widgets/profile_detail/profile_detail.dart';
import 'widgets/profile_history_of_changes.dart';
import 'widgets/profile_logs/profile_logs.dart';
import 'widgets/profile_projects.dart';

class ProfileScreen extends StatefulWidget {
  final int id;

  const ProfileScreen({
    required this.id,
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late PositionModel position;
  late List<SkillModel> skills;
  late EmployeeByIdModel employee;
  late CallsModel calls;
  bool isLoading = true;

  void _loadData() async {
    try {
      ProfileService profileService = ProfileService();
      employee = await profileService.fetchEmployeeById(widget.id);
      position = await profileService.fetchEmployeePosition(employee.id ?? 0);
      skills = await profileService.fetchEmployeeSkills(employee.id ?? 0);
      calls = await profileService.fetchEmployeeCalls(employee.id ?? 0);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      fatal('Error loading data: $e');
    }
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          "My account",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: AppColors.lightDark95,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                      color: AppColors.lightDark90,
                                      border: Border.all(
                                        color: AppColors.lightDark85,
                                        width: 1,
                                      ),
                                      image: employee.photo != null
                                          ? DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                ApiConstants.baseUrl +
                                                    employee.photo!,
                                              ),
                                            )
                                          : null,
                                    ),
                                    child: employee.photo == null
                                        ? Center(
                                            child: Text(
                                              employee.firstName![0] +
                                                  employee.lastName![0],
                                              style: const TextStyle(
                                                  color: AppColors.black10),
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${employee.firstName ?? ""} ${employee.lastName ?? ""}",
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      employee.role?.title ?? "",
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.lightBlue95,
                                    shape: const ContinuousRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: AppColors.blue,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Редактировать",
                                    style: TextStyle(
                                      color: AppColors.blue,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: 100,
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.white,
                                    shape: const ContinuousRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: AppColors.black10,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Icon(
                                    CupertinoIcons.ellipsis,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: AppColors.lightDark95,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 30,
                              ),
                              child: Column(
                                children: [
                                  DataSectionItem(
                                    icon: CupertinoIcons.person,
                                    text: "Основное",
                                    page: ProfileDetail(
                                      employee: employee,
                                      skills: skills,
                                      position: position,
                                    ),
                                  ),
                                  _buildDivider(),
                                  DataSectionItem(
                                    icon: CupertinoIcons.phone,
                                    text: "Звонки",
                                    page: ProfileCalls(
                                      calls: calls,
                                    ),
                                  ),
                                  _buildDivider(),
                                  const DataSectionItem(
                                    icon: CupertinoIcons.square_list,
                                    text: "Проекты",
                                    page: ProfileProjects(),
                                  ),
                                  _buildDivider(),
                                  const DataSectionItem(
                                    icon: CupertinoIcons.calendar_today,
                                    text: "Логи",
                                    page: ProfileLogs(),
                                  ),
                                  _buildDivider(),
                                  const DataSectionItem(
                                    icon: CupertinoIcons.clock,
                                    text: "История изменений",
                                    page: ProfileHistoryOfChanges(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(),
    );
  }
}

class DataSectionItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget page;

  const DataSectionItem({
    super.key,
    required this.icon,
    required this.text,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.black,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              CupertinoIcons.right_chevron,
            ),
          ],
        ),
      ),
    );
  }
}
