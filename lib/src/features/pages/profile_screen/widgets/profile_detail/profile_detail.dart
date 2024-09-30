import 'package:flutter/material.dart';
import '../../../../../core/models/profile_models/employee_by_id_model.dart';
import '../../../../../core/models/profile_models/position_model.dart';
import '../../../../../core/styles/app_colors.dart';
import 'widgets/profile_employee_details_widget.dart';

class ProfileDetail extends StatefulWidget {
  final EmployeeByIdModel employee;
  final PositionModel position;
  const ProfileDetail({
    super.key,
    required this.employee,
    required this.position,
  });

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightDark95,
      appBar: AppBar(
        surfaceTintColor: AppColors.lightDark95,
        backgroundColor: AppColors.lightDark95,
        centerTitle: true,
        leading: BackButton(
          style: ButtonStyle(
            iconSize: WidgetStateProperty.all(20),
          ),
        ),
        title: const Text(
          "Профиль",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ProfileEmployeeDetailsWidget(
                    employee: widget.employee,
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
