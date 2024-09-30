import 'package:qbox_mobile/src/features/pages/knowledge_base/widget/sellect_project_bottom_sheet.dart';
import 'package:qbox_mobile/src/features/pages/knowledge_base/widget/search_bottom_sheet.dart';
import 'package:qbox_mobile/src/features/providers/knowledge_base_provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    final provider = Provider.of<KnowledgeBaseProvider>(context, listen: false);
    provider.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KnowledgeBaseProvider>(
      builder: (
        BuildContext context,
        KnowledgeBaseProvider provider,
        Widget? child,
      ) =>
          AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            provider.clearAllData();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: AppColors.white,
              builder: (context) => const SellectProjectBottomSheet(),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 160,
                    child: Text(
                      provider.collectionName ?? 'Select',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        color: AppColors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: AppColors.black,
                  ),
                ],
              ),
              const Text(
                'Новая база знаний',
                style: TextStyle(fontSize: 14, color: AppColors.grey),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: AppColors.white,
                builder: (BuildContext context) => const SearchBottomSheet(),
              );
            },
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton<int>(
            color: AppColors.white,
            onSelected: (int value) => provider.setLang(value),
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
      ),
    );
  }
}
