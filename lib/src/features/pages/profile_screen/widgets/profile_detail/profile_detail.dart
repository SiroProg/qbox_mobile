import 'package:flutter/material.dart';
import '../../../../../core/models/profile_models/employee_by_id_model.dart';
import '../../../../../core/models/profile_models/position_model.dart';
import '../../../../../core/models/profile_models/skill_model.dart';
import '../../../../../core/styles/app_colors.dart';
import 'widgets/profile_employee_details_widget.dart';
import 'widgets/profile_header_widget.dart';

class ProfileDetail extends StatefulWidget {
  final EmployeeByIdModel employee;
  final List<SkillModel> skills;
  final PositionModel position;
  const ProfileDetail({
    super.key,
    required this.employee,
    required this.skills,
    required this.position,
  });

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          "Профиль",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileHeaderWidget(
                  employee: widget.employee,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ProfileEmployeeDetailsWidget(
                    employee: widget.employee,
                    skills: widget.skills,
                    position: widget.position,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
