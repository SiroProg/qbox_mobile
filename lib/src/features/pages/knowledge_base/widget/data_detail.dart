import 'package:flutter_svg/svg.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/styles/app_svg.dart';

import '../../../services/knowledge_base_service/knowledge_base_service.dart';
import 'package:html_viewer_elite/html_viewer_elite.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import 'package:flutter/material.dart';

class DataDetail extends StatefulWidget {
  const DataDetail({
    required this.pageId,
    required this.accessType,
    required this.title,
    super.key,
  });

  final int pageId;
  final String accessType;
  final String title;

  @override
  State<DataDetail> createState() => _DataDetailState();
}

class _DataDetailState extends State<DataDetail> {
  String htmlCode = '';
  bool isLoading = true;

  void _fetchData() async {
    try {
      String data = await KnowledgeBaseService.jsonToHtml(
        widget.pageId,
        widget.accessType,
      );
      warning(data);

      setState(() {
        htmlCode = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        htmlCode = '';
        isLoading = false;
      });
      warning("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blue,
                ),
              )
            : htmlCode.isEmpty
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.string(
                          AppSvg.empty,
                          width: 120,
                          height: 120,
                        ),
                        const Text('Ничего не найдено'),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Html(data: htmlCode),
                    ),
                  ),
      );
}
