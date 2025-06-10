import 'package:flutter/material.dart';
import 'package:news_app/core/utils/backend_id_manager.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/strings_manager.dart';

class CategoryDataModel {
  CategoryDataModel(this.isLeft, this.title, this.bgColor, this.categoryImage,
      this.backendId);

  bool isLeft;
  String backendId;
  String title;
  Color bgColor;
  String categoryImage;

  static List<CategoryDataModel> getAllCategories = [
    CategoryDataModel(true, StringsManager.sports, ColorsManager.red,
        AssetsManager.sportsImage, BackendIdManager.sportsId),
    CategoryDataModel(false, StringsManager.politics, ColorsManager.blue,
        AssetsManager.politicsImage, BackendIdManager.sportsId),
    CategoryDataModel(true, StringsManager.health, ColorsManager.pink,
        AssetsManager.healthImage, BackendIdManager.healthId),
    CategoryDataModel(false, StringsManager.business, ColorsManager.brown,
        AssetsManager.businessImage, BackendIdManager.businessId),
    CategoryDataModel(
        false,
        StringsManager.environment,
        ColorsManager.lightBlue,
        AssetsManager.environmentImage,
        BackendIdManager.entertainmentId),
    CategoryDataModel(false, StringsManager.science, ColorsManager.yellow,
        AssetsManager.scienceImage, BackendIdManager.scienceId),
    CategoryDataModel(true, StringsManager.technology, Colors.purple,
        AssetsManager.sportsImage, BackendIdManager.technologyId)
  ];
}
