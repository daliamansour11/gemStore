


import '../../../../core/network/data_state.dart';
import '../home_entities/mainCategory_entity.dart';

abstract class MainCategoryRepositoryInterface{
  Future<DataState<List<MainCategoryEntity>>> getMainCategories();

}