import 'package:flutter/cupertino.dart';

import '../../../../../../core/constants/config.dart';
import '../../../../../../core/models/profile_models/employee_by_id_model.dart';
import '../../../../../../core/styles/app_colors.dart';

class ProfileHeaderWidget extends StatefulWidget {
  final EmployeeByIdModel employee;
  const ProfileHeaderWidget({
    super.key,
    required this.employee,
  });

  @override
  State<ProfileHeaderWidget> createState() => _ProfileHeaderWidgetState();
}

class _ProfileHeaderWidgetState extends State<ProfileHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              color: AppColors.lightDark95,
              image: widget.employee.photo != null
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "${Config.baseUrl + widget.employee.photo!}",
                      ),
                    )
                  : null,
            ),
            child: widget.employee.photo == null
                ? Center(
                    child: Text(
                      "${widget.employee.firstName![0] + widget.employee.lastName![0]}",
                      style: TextStyle(color: AppColors.black10),
                    ),
                  )
                : null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "${widget.employee.firstName ?? ""} ${widget.employee.lastName ?? ""}",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          widget.employee.role?.title ?? "",
          style: TextStyle(
            color: AppColors.black10,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
