import '../../domain/home_entities/mainCategory_entity.dart';

abstract class MainCategoriesState {}

class MainCategoriesInitial extends MainCategoriesState {}

class MainCategoriesLoading extends MainCategoriesState {}

class MainCategoriesSuccess extends MainCategoriesState {
  final List<MainCategoryEntity> mainCategories;
  MainCategoriesSuccess(this.mainCategories);
}

class MainCategoriesError extends MainCategoriesState {
  final String message;
  MainCategoriesError(this.message);
}

class ChangeSelectedIndexState extends MainCategoriesState {
  final int selectedIndex;

  ChangeSelectedIndexState(this.selectedIndex);
}
