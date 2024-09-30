import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/models/knowledge_base/new/kbase_data_model.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/knowledge_base/widget/data_detail.dart';
import 'package:qbox_mobile/src/features/pages/knowledge_base/widget/data_view_screen.dart';
import 'package:qbox_mobile/src/features/pages/knowledge_base/widget/network_image_widget.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.item,
    super.key,
  });

  final KbaseDataModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: ColoredBox(
        color: AppColors.grey.withOpacity(0.1),
        child: ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            side: BorderSide(
              color: AppColors.grey,
            ),
          ),
          onTap: () {
            if (item.childAmount == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataDetail(
                    pageId: item.id,
                    accessType: 'external',
                    title: item.title,
                  ),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataViewScreen(
                    parentId: item.id,
                    collectionId: item.collectionId,
                    title: item.title,
                  ),
                ),
              );
            }
          },
          title: Text(
            item.title,
            style: const TextStyle(fontSize: 14),
          ),
          leading: NetworkImageWidget(
            imageUrl: item.icon,
            width: 25,
            height: 25,
          ),
        ),
      ),
    );
  }
}
