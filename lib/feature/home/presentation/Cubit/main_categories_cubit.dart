import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/data_state.dart';
import '../../../../core/network/error/error_handle.dart';
import '../../domain/home_entities/mainCategory_entity.dart';
import '../../domain/home_usecases/get_main_categories_usecase.dart';
import 'main_Categories_state.dart';

class MainCategoriesCubit extends Cubit<MainCategoriesState> {
  final GetMainCategoriesUseCase _getMainCategoriesUseCase;

  MainCategoriesCubit(this._getMainCategoriesUseCase)
      : super(MainCategoriesInitial());
  List<MainCategoryEntity> mainCategories = [];
  int selectedIndex = 0;
  Future<void> fetchMainCategories() async {
    try {
      safeEmit(MainCategoriesLoading());
      final dataState = await _getMainCategoriesUseCase();

      if (dataState is DataSuccess<List<MainCategoryEntity>> &&
          dataState.data != null) {
        mainCategories = dataState.data ?? [];
        safeEmit(MainCategoriesSuccess(dataState.data!));
      } else if (dataState is DataFailed) {
        final errorMessage = getErrorMessage(dataState.error!);
        safeEmit(MainCategoriesError(errorMessage));
      }
    } catch (e) {
      print('error: ${e}');
    }
  }

  void changeSelectedIndex(int indx) {
    selectedIndex = indx;
    safeEmit(ChangeSelectedIndexState(selectedIndex));
  }

  void safeEmit(MainCategoriesState state) {
    if (!isClosed) emit(state);
  }
}
