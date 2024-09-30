import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/models/profile_models/employee_by_id_model.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/models/profile_models/log_model.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../providers/profile_provider.dart';
import '../../../../services/profile_service/profile_service.dart';

class ProfileLogs extends StatefulWidget {
  final EmployeeByIdModel employee;
  const ProfileLogs({
    super.key,
    required this.employee,
  });

  @override
  State<ProfileLogs> createState() => _ProfileLogsState();
}

class _ProfileLogsState extends State<ProfileLogs> {
  Map<String, dynamic> _allActions = {};
  Map<String, dynamic> _allEvents = {};
  String date = DateTime.now().toIso8601String().substring(0, 10);
  List<LogModel> _allLogs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadActions();
    _loadEvents();
    _loadLogs();
  }

  void _loadActions() async {
    ProfileService apiService = ProfileService();
    _allActions = await apiService.getActions();
    _allActions = _allActions["events"];
  }

  void _loadEvents() async {
    ProfileService apiService = ProfileService();
    _allEvents = await apiService.getEvents();
    _allEvents = _allEvents["events"];
  }

  void _loadLogs() async {
    ProfileService apiService = ProfileService();
    _allLogs = await apiService.fetchAuditData(date, widget.employee.id ?? 0);
    setState(() {});
  }

  Future<DateTime?> onDateSelected() async {
    _loadLogs();

    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
  }

  void _showPopupMenu(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      isScrollControlled: false,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.8,
          builder: (BuildContext context, ScrollController scrollController) {
            return ListView.builder(
              controller: scrollController,
              itemCount: _allEvents.length,
              itemBuilder: (context, index) {
                String key = _allEvents.keys.elementAt(index);
                List actions = _allEvents[key];
                return ExpansionTile(
                  title: Text(key),
                  children: actions.map((actionIndex) {
                    return ListTile(
                      title: Text(_allActions[actionIndex]),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Логи",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const BackButton(
          color: AppColors.black,
          style: ButtonStyle(
            iconSize: WidgetStatePropertyAll(20),
          ),
        ),
      ),
      backgroundColor: AppColors.lightDark95,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, bottom: 5),
                child: Text(
                  'Дата',
                  style: TextStyle(
                    color: AppColors.black10,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                  backgroundColor: AppColors.white,
                                  side: BorderSide(
                                    color: AppColors.lightDark90,
                                  ),
                                ),
                                onPressed: () async {
                                  final selectedDate = await onDateSelected();
                                  if (selectedDate != null) {
                                    date = selectedDate
                                        .toIso8601String()
                                        .substring(0, 10);
                                    profileProvider
                                        .setSelectedDateFromLogs(selectedDate);
                                    _loadLogs();
                                  }
                                },
                                child: Text(
                                  profileProvider.selectedDateFromLogs
                                      .toIso8601String()
                                      .substring(0, 10),
                                  style: const TextStyle(
                                    color: AppColors.black10,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            Text(' - '),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                  backgroundColor: AppColors.white,
                                  side: BorderSide(
                                    color: AppColors.lightDark90,
                                  ),
                                ),
                                onPressed: () async {
                                  final selectedDate = await onDateSelected();
                                  if (selectedDate != null) {
                                    date = selectedDate
                                        .toIso8601String()
                                        .substring(0, 10);
                                    profileProvider
                                        .setSelectedDateFromLogs(selectedDate);
                                    _loadLogs();
                                  }
                                },
                                child: Text(
                                  profileProvider.selectedDateFromLogs
                                      .toIso8601String()
                                      .substring(0, 10),
                                  style: const TextStyle(
                                    color: AppColors.black10,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, bottom: 5),
                child: Text(
                  'Действия',
                  style: TextStyle(
                    color: AppColors.black10,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              backgroundColor: AppColors.white,
                              side: BorderSide(color: AppColors.lightDark90),
                            ),
                            onPressed: () => _showPopupMenu(context),
                            child: const Text(
                              'Действия',
                              style: TextStyle(
                                color: AppColors.black10,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, bottom: 5),
                child: Text(
                  'Результаты',
                  style: TextStyle(
                    color: AppColors.black10,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    _allLogs.length,
                    (value) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 40,
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
                                          image:
                                              _allLogs[value].employee?.photo !=
                                                      null
                                                  ? DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        ApiConstants.baseUrl +
                                                            _allLogs[value]
                                                                .employee!
                                                                .photo!,
                                                      ),
                                                    )
                                                  : null,
                                        ),
                                        child: _allLogs[value]
                                                    .employee
                                                    ?.photo ==
                                                null
                                            ? Center(
                                                child: Text(
                                                  _allLogs[value]
                                                          .employee
                                                          ?.firstName![0] ??
                                                      _allLogs[value]
                                                          .employee!
                                                          .lastName![0],
                                                  style: const TextStyle(
                                                    color: AppColors.black10,
                                                  ),
                                                ),
                                              )
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_allLogs[value].employee?.firstName} ${_allLogs[value].employee?.lastName}",
                                          style: const TextStyle(
                                            color: AppColors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "@${_allLogs[value].employee?.username}",
                                          style: const TextStyle(
                                            color: AppColors.black10,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      profileProvider.formatUnixTimeToTime(
                                          _allLogs[value].createdAt!),
                                      style: const TextStyle(
                                        color: AppColors.black10,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  "Вошел(-ла) в систему",
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
