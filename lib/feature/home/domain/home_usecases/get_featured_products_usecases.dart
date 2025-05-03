
import '../../../../core/network/data_state.dart';
import '../../../../core/usecases/useCase.dart';

import '../../data/home_repo_imp/featured_products_repo_imp.dart';
import '../home_entities/featured_products_entity.dart';
class GetFeaturedProductsUseCase implements UseCase<DataState<List<FeaturedProductsEntity>>, PaginationParams> {
  final FeaturedProductsRepoImp _productsRepo;

  GetFeaturedProductsUseCase(this._productsRepo);

  @override
  Future<DataState<List<FeaturedProductsEntity>>> call({required PaginationParams params}) {
    return _productsRepo.getFeaturedProducts(params.limit, params.offset);
  }
}

class PaginationParams {
  final int limit;
  final int offset;

  PaginationParams({required this.limit, required this.offset});
}