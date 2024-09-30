import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/knowledge_base/widget/custom_app_bar.dart';
import 'package:qbox_mobile/src/features/pages/knowledge_base/widget/custom_list_tile.dart';
import 'package:qbox_mobile/src/features/providers/knowledge_base_provider.dart';

class KnowledgeBaseScreen extends StatefulWidget {
  const KnowledgeBaseScreen({super.key});

  @override
  State<KnowledgeBaseScreen> createState() => _KnowledgeBaseScreenState();
}

class _KnowledgeBaseScreenState extends State<KnowledgeBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<KnowledgeBaseProvider>(
      builder: (
        BuildContext context,
        KnowledgeBaseProvider provider,
        Widget? child,
      ) =>
          // ignore: deprecated_member_use
          WillPopScope(
        onWillPop: () {
          provider.clearAllData();
          return Future.value(true);
        },
        child: Scaffold(
          appBar: const CustomAppBar(),
          body: provider.kBaseData.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.blue),
                )
              : ListView(
                  children: List.generate(
                    provider.kBaseData.length,
                    (index) => CustomListTile(item: provider.kBaseData[index]),
                  ),
                ),
        ),
      ),
    );
  }
}
