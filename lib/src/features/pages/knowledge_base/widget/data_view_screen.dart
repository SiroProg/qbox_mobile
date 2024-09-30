import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/models/knowledge_base/new/kbase_data_model.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/knowledge_base/widget/custom_list_tile.dart';
import 'package:qbox_mobile/src/features/providers/knowledge_base_provider.dart';
import 'package:qbox_mobile/src/features/services/knowledge_base_service/knowledge_base_service.dart';

class DataViewScreen extends StatefulWidget {
  const DataViewScreen({
    required this.parentId,
    required this.collectionId,
    required this.title,
    super.key,
  });

  final int parentId;
  final int collectionId;
  final String title;

  @override
  State<DataViewScreen> createState() => _DataViewScreenState();
}

class _DataViewScreenState extends State<DataViewScreen> {
  List<KbaseDataModel> data = [];

  void _fetchData() async {
    final provider = Provider.of<KnowledgeBaseProvider>(context, listen: false);

    data = await KnowledgeBaseService.getKBaseData(
      collectionId: widget.collectionId,
      parentId: widget.parentId,
      lang: provider.langID,
    );

    setState(() {});
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: data.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.blue,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: List.generate(
                  data.length,
                  (index) => CustomListTile(item: data[index]),
                ),
              ),
            ),
    );
  }
}
