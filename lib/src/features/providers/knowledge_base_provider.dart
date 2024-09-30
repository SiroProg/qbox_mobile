import 'package:qbox_mobile/src/core/models/knowledge_base/new/kbase_data_model.dart';
import 'package:qbox_mobile/src/core/models/knowledge_base/new/kbase_item_model.dart';
import 'package:qbox_mobile/src/features/services/knowledge_base_service/knowledge_base_service.dart';
import 'package:flutter/cupertino.dart';

class KnowledgeBaseProvider extends ChangeNotifier {
  List<KbaseDataModel> kBaseData = [];
  List<KbaseItemModel> kBaseItem = [];
  List<KbaseDataModel> foundItems = [];

  Map<int, KbaseItemModel> kBaseItemMap = {};

  int collectionId = 0;

  String? collectionName;
  int langID = 1;

  void setLang(int value) async {
    kBaseData.clear();
    notifyListeners();

    langID = value;

    kBaseData = await KnowledgeBaseService.getKBaseData(
      collectionId: collectionId,
      parentId: 0,
      lang: langID,
    );

    setCollectionName();

    notifyListeners();
  }

  void setCollectionName() {
    kBaseItemMap = {for (var item in kBaseItem) item.id: item};

    if (kBaseItemMap.containsKey(collectionId)) {
      collectionName = kBaseItemMap[collectionId]?.title;
    } else {
      collectionName = collectionName;
    }

    notifyListeners();
  }

  void setItem(int value) async {
    collectionId = value;

    setCollectionName();

    kBaseData = await KnowledgeBaseService.getKBaseData(
      collectionId: collectionId,
      parentId: 0,
      lang: langID,
    );
    notifyListeners();
  }

  void initialize() async {
    langID = 3;

    kBaseItem = await KnowledgeBaseService.getKBaseItem();
    if (kBaseItem.isNotEmpty) {
      collectionId = kBaseItem[0].id;
    }

    notifyListeners();

    kBaseData = await KnowledgeBaseService.getKBaseData(
      collectionId: collectionId,
      parentId: 0,
    );

    setCollectionName();

    notifyListeners();
  }

  void searchResponse(String? value) async {
    foundItems.clear();

    notifyListeners();

    foundItems = await KnowledgeBaseService.searchItem(
      collectionID: collectionId,
      langId: langID,
      q: value ?? '',
    );

    notifyListeners();
  }

  void clearAllData() {
    kBaseData.clear();
    kBaseItem.clear();
    foundItems.clear();
    kBaseItemMap.clear();
    collectionId = 0;
    collectionName = '';
    langID = 1;
    notifyListeners();
  }
}
