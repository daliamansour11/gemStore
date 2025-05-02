import '../../../../core/network/data_state.dart';
import '../../../../core/usecases/useCase.dart';
// import '../home_entities/category_entity.dart';
import '../home_entities/mainCategory_entity.dart';
import '../home_repo_interface/main_category_repo.dart';

class GetMainCategoriesUseCase
    implements UseCase<DataState<List<MainCategoryEntity>>, void> {
  final MainCategoryRepositoryInterface _mainCategoriesRepo;

  GetMainCategoriesUseCase(this._mainCategoriesRepo);

  @override
  Future<DataState<List<MainCategoryEntity>>> call({void params}) {
    return _mainCategoriesRepo.getMainCategories();
  }
}
