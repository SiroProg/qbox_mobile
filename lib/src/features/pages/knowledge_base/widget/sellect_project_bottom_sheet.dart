import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/constants/api_constants.dart';
import 'package:qbox_mobile/src/features/pages/knowledge_base/widget/network_image_widget.dart';
import 'package:qbox_mobile/src/features/providers/knowledge_base_provider.dart';

class SellectProjectBottomSheet extends StatelessWidget {
  const SellectProjectBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KnowledgeBaseProvider>(
      builder: (
        BuildContext context,
        KnowledgeBaseProvider provider,
        Widget? child,
      ) =>
          SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            AppBar(
              title: const Text('Items'),
              centerTitle: true,
              automaticallyImplyLeading: false,
              actions: const <Widget>[
                CloseButton(),
              ],
            ),
            Expanded(
              child: ListView(
                children: List.generate(
                  provider.kBaseItem.length,
                  (index) {
                    final item = provider.kBaseItem[index];
                    return ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        provider.setItem(item.id);
                        provider.setCollectionName();
                      },
                      title: Text(item.title ?? ''),
                      leading: NetworkImageWidget(
                        imageUrl: "${ApiConstants.baseUrl}${item.icon}",
                        height: 30,
                        width: 30,
                      ),
                    );
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
