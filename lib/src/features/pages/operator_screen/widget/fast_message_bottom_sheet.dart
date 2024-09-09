import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/employess/widget/custom_button.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final ValueNotifier<String?> _selectedDescription =
      ValueNotifier<String?>(null);
  final ValueNotifier<String?> _selectedTitle = ValueNotifier<String?>(null);

  @override
  void dispose() {
    _selectedDescription.dispose();
    _selectedTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (
        BuildContext context,
        ChatProvider provider,
        Widget? child,
      ) {
        final isLoading = provider.fastMessage.isEmpty;

        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              ValueListenableBuilder<String?>(
                valueListenable: _selectedTitle,
                builder: (context, title, child) {
                  return AppBar(
                    title: Text(title ?? 'Select Message'),
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    leading: title == null
                        ? null
                        : IconButton(
                            onPressed: () {
                              _selectedDescription.value = null;
                              _selectedTitle.value = null;
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                    actions: title != null
                        ? null
                        : [
                            PopupMenuButton<int>(
                              color: AppColors.white,
                              onSelected: (int value) {
                                provider.setFastMessageLang(value);
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  const PopupMenuItem<int>(
                                    value: 1,
                                    child: Text('Русский'),
                                  ),
                                  const PopupMenuItem<int>(
                                    value: 2,
                                    child: Text('Қазақша'),
                                  ),
                                  const PopupMenuItem<int>(
                                    value: 3,
                                    child: Text('English'),
                                  ),
                                ];
                              },
                              icon: const Icon(Icons.language),
                            ),
                          ],
                  );
                },
              ),
              Expanded(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(color: AppColors.blue),
                      )
                    : ValueListenableBuilder<String?>(
                        valueListenable: _selectedDescription,
                        builder: (context, description, child) {
                          if (description != null) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        description,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomButton(
                                    onPressed: () {
                                      provider.setMessage(description);
                                      Navigator.pop(context);
                                    },
                                    text: 'Select',
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: provider.fastMessage.length,
                              itemBuilder: (context, index) {
                                final message = provider.fastMessage[index];
                                return ListTile(
                                  title: Text(message.title),
                                  onTap: () {
                                    _selectedDescription.value =
                                        message.description;
                                    _selectedTitle.value = message.title;
                                  },
                                );
                              },
                            );
                          }
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
