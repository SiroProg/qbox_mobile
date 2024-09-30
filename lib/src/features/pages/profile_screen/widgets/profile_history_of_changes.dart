import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../providers/profile_provider.dart';

class ProfileHistoryOfChanges extends StatefulWidget {
  const ProfileHistoryOfChanges({super.key});

  @override
  State<ProfileHistoryOfChanges> createState() =>
      _ProfileHistoryOfChangesState();
}

class _ProfileHistoryOfChangesState extends State<ProfileHistoryOfChanges> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'История изменений',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
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
        child: Column(
          children: [
            Padding(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                                    onPressed: () async {},
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
                                    onPressed: () async {},
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
                                  side:
                                      BorderSide(color: AppColors.lightDark90),
                                ),
                                onPressed: () {},
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
