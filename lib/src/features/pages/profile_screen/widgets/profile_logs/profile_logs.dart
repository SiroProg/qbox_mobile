import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/models/profile_models/log_model.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../providers/profile_provider.dart';
import '../../../../services/profile_service/profile_service.dart';

class ProfileLogs extends StatefulWidget {
  const ProfileLogs({
    super.key,
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
    _allLogs = await apiService.fetchAuditData(date);
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
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          height: 500,
          child: DraggableScrollableSheet(
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
                    children: actions
                        .map(
                          (actionIndex) => ListTile(
                            title: Text(_allActions[actionIndex]),
                            onTap: () {
                              print(
                                  'Selected from $key: ${_allActions[actionIndex]}');
                              Navigator.pop(context);
                            },
                          ),
                        )
                        .toList(),
                  );
                },
              );
            },
          ),
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
        leading: const BackButton(
          color: AppColors.black,
        ),
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Логи",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: AppColors.lightDark85, width: 1),
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
                            const Text(
                              "Дата",
                              style: TextStyle(
                                color: AppColors.black10,
                                fontSize: 18,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
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
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Действия",
                              style: TextStyle(
                                color: AppColors.black10,
                                fontSize: 18,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () => _showPopupMenu(context),
                              child: const Text(
                                'Действия',
                                style: TextStyle(
                                  color: AppColors.black10,
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
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    _allLogs.length,
                    (value) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              color: AppColors.lightDark85,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
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
                                      children: [
                                        Text(
                                          "${_allLogs[value].employee?.firstName} ${_allLogs[value].employee?.lastName}",
                                          style: const TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "@${_allLogs[value].employee?.username}",
                                          style: const TextStyle(
                                            color: AppColors.black10,
                                            fontSize: 16,
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
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Вошел(-ла) в систему",
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
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
