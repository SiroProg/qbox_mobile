import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/features/pages/employess/widget/custom_button.dart';
import 'package:qbox_mobile/src/features/pages/employess/widget/role_widget.dart';
import 'package:qbox_mobile/src/features/providers/employees_provider.dart';

import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int? selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeesProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Filter'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => provider.clearFilter(),
              icon: const Icon(CupertinoIcons.trash),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Role',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RoleWidget(
                title: provider.sellectedRoles,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Sleect Role',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: provider.filterData.roles.length,
                              itemBuilder: (context, index) {
                                final role = provider.filterData.roles[index];
                                return RoleWidget(
                                  title: role.title,
                                  onTap: () {
                                    provider.setdRoles(role.title);
                                    provider.setRoleId(role.id);

                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const Text(
                'Goup',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RoleWidget(
                title: provider.sellectedGroup,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Sleect Group',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: provider.filterData.userGroups.length,
                              itemBuilder: (context, index) {
                                final userGroups =
                                    provider.filterData.userGroups[index];
                                return RoleWidget(
                                  title: userGroups.title,
                                  onTap: () {
                                    provider.setdGroup(userGroups.title);
                                    provider.setGroupId(userGroups.id);

                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Status',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              RadioListTile(
                value: 1,
                dense: true,
                controlAffinity: ListTileControlAffinity.trailing,
                groupValue: provider.filterData.status,
                onChanged: (value) => provider.setStatus(value),
                title: const Text(
                  'Active',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              RadioListTile(
                dense: true,
                controlAffinity: ListTileControlAffinity.trailing,
                value: 0,
                groupValue: provider.filterData.status,
                onChanged: (value) => provider.setStatus(value),
                title: const Text(
                  'Blocked',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              RadioListTile(
                value: -1,
                dense: true,
                controlAffinity: ListTileControlAffinity.trailing,
                groupValue: provider.filterData.status,
                onChanged: (value) => provider.setStatus(value),
                title: const Text(
                  'Deleted',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Additional filters',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CheckboxListTile(
                value: provider.filterData.groupId == -1,
                onChanged: (value) {
                  if (value!) {
                    provider.setGroupId(-1);
                  } else {
                    provider.setGroupId(null);
                  }
                },
                title: const Text(
                  'With out a group',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              CheckboxListTile(
                value: provider.filterData.externalId == 1,
                onChanged: (value) {
                  if (value!) {
                    provider.setExtranalId(1);
                  } else {
                    provider.setExtranalId(null);
                  }
                },
                title: const Text(
                  'Extranal ID',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              CheckboxListTile(
                value: provider.filterData.sipId == 1,
                onChanged: (value) {
                  if (value!) {
                    provider.setSipId(1);
                  } else {
                    provider.setSipId(null);
                  }
                },
                title: const Text(
                  'Sip ID',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  provider.filterData.page = 1;
                  provider.fetchData();
                  Navigator.pop(context);
                },
                text: 'Apply',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
