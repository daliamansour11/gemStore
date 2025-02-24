import 'package:flutter/foundation.dart';

import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import 'category_model.dart';

final List<CategoryModel> categories = [
  CategoryModel(icon: ImageAssets.womenIcon, label: AppString.women),
  CategoryModel(icon: ImageAssets.menIcon, label: AppString.men),
  CategoryModel(icon: ImageAssets.accessoriesIcon, label: AppString.accessories),
  CategoryModel(icon: ImageAssets.beautyIcon, label: AppString.beauty),
];
