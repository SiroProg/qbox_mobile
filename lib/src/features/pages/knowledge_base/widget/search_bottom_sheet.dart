import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/knowledge_base/widget/custom_list_tile.dart';
import 'package:qbox_mobile/src/features/providers/knowledge_base_provider.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KnowledgeBaseProvider>(
      builder: (
        BuildContext context,
        KnowledgeBaseProvider provider,
        Widget? child,
      ) =>
          Container(
        height: MediaQuery.of(context).size.height - 30,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            AppBar(
              automaticallyImplyLeading: false,
              actions: const [CloseButton()],
              title: SizedBox(
                height: 40,
                child: Center(
                  child: TextField(
                    onChanged: (value) => provider.searchResponse(value),
                    cursorHeight: 18,
                    cursorColor: AppColors.blue,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: AppColors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blue),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      isDense: true,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: List.generate(
                  provider.foundItems.length,
                  (index) {
                    final response = provider.foundItems[index];
                    return CustomListTile(item: response);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
