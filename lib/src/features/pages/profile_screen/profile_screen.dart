import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qbox_mobile/src/core/styles/app_svg.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import 'package:qbox_mobile/src/features/pages/profile_screen/widgets/profile_contacts.dart';
import 'package:qbox_mobile/src/features/pages/profile_screen/widgets/profile_notification.dart';
import 'package:qbox_mobile/src/features/services/profile_service/profile_service.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/models/profile_models/calls_model.dart';
import '../../../core/models/profile_models/employee_by_id_model.dart';
import '../../../core/models/profile_models/position_model.dart';
import '../../../core/styles/app_colors.dart';
import 'widgets/profile_calls/profile_calls.dart';
import 'widgets/profile_detail/profile_detail.dart';
import 'widgets/profile_history_of_changes.dart';
import 'widgets/profile_logs/profile_logs.dart';

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
  late EmployeeByIdModel employee;
  late CallsModel calls;
  bool isLoading = true;

  void _loadData() async {
    try {
      ProfileService profileService = ProfileService();
      employee = await profileService.fetchEmployeeById(widget.id);
      position = await profileService.fetchEmployeePosition(employee.id ?? 0);
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
      backgroundColor: AppColors.lightDark95,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Аккаунт',
                            style: TextStyle(
                              color: AppColors.black10,
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 55,
                                    height: 55,
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
                                                  color: AppColors.black10,
                                                ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${employee.firstName ?? ""} ${employee.lastName ?? ""}",
                                        style: const TextStyle(
                                          color: AppColors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        employee.role?.title ?? "",
                                        style: const TextStyle(
                                          color: AppColors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.more_vert_outlined,
                                      color: AppColors.black,
                                      size: 20,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 40,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Редактировать",
                                    style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  SvgPicture.string(
                                    AppSvg.edit,
                                    width: 15,
                                    height: 15,
                                    color: AppColors.blue,
                                  )
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  children: [
                                    DataSectionItem(
                                      text: 'Основные',
                                      description:
                                          'Основые данные о сотруднике',
                                      page: ProfileDetail(
                                        employee: employee,
                                        position: position,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  children: [
                                    DataSectionItem(
                                      text: 'Уведомления',
                                      description:
                                          'Основые данные о сотруднике',
                                      page: ProfileNotification(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Divider(
                                        color: AppColors.lightDark85,
                                      ),
                                    ),
                                    DataSectionItem(
                                      text: 'Звонки',
                                      description:
                                          'Основые данные о сотруднике',
                                      page: ProfileCalls(
                                        calls: calls,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Divider(
                                        color: AppColors.lightDark85,
                                      ),
                                    ),
                                    DataSectionItem(
                                      text: 'Контакты',
                                      description:
                                          'Основые данные о сотруднике',
                                      page: ProfileContacts(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  children: [
                                    DataSectionItem(
                                      text: 'Логи',
                                      description:
                                          'Основые данные о сотруднике',
                                      page: ProfileLogs(employee: employee),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Divider(
                                        color: AppColors.lightDark85,
                                      ),
                                    ),
                                    DataSectionItem(
                                      text: 'История изменений',
                                      description:
                                          'Основые данные о сотруднике',
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
  final String text;
  final String description;
  final Widget page;

  const DataSectionItem({
    super.key,
    required this.text,
    required this.description,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
      },
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.right_chevron,
                color: AppColors.black10,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
