import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({
    required this.onAccept,
    required this.onCancel,
    super.key,
  });

  final VoidCallback onAccept;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF9000B0),
              Color(0xFF00B4DB),
              Color(0xFF9000B0),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Consumer<ChatProvider>(
              builder: (context, provider, child) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.grey.withOpacity(0.2),
                    backgroundImage: provider.callUserModel?.photo != null
                        ? NetworkImage(provider.callUserModel!.photo!)
                        : null,
                    child: provider.callUserModel?.photo == null
                        ? const Icon(
                            Icons.person,
                            size: 60,
                            color: AppColors.white,
                          )
                        : null,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${provider.callUserModel?.firstName ?? ''} ${provider.callUserModel?.lastName ?? ''}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Field',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Value',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        const DataCell(
                          Text(
                            'Phone',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            provider.callUserModel?.phone ?? '',
                            style: const TextStyle(color: AppColors.white),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        const DataCell(
                          Text(
                            'IIN',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            provider.callUserModel?.iin ?? '',
                            style: const TextStyle(color: AppColors.white),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        const DataCell(
                          Text(
                            'Language',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            provider.callUserModel?.lang ?? '',
                            style: const TextStyle(color: AppColors.white),
                          ),
                        ),
                      ]),
                      // const DataRow(cells: [
                      //   DataCell(
                      //     Text(
                      //       'Age',
                      //       style: TextStyle(color: AppColors.white),
                      //     ),
                      //   ),
                      //   DataCell(
                      //     Text(
                      //       '32', // Yoshni avtomatik o'zgartirishingiz mumkin
                      //       style: TextStyle(color: AppColors.white),
                      //     ),
                      //   ),
                      // ]),
                      DataRow(cells: [
                        const DataCell(
                          Text(
                            'Line',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            provider.callUserModel?.queue ?? '',
                            style: const TextStyle(color: AppColors.white),
                          ),
                        ),
                      ]),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onCancel,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red,
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onAccept,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: AppColors.white,
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
      ),
    );
  }
}
