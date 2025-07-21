import '../../../../core/network/data_state.dart';
import '../../../../core/usecases/useCase.dart';
import '../home_entities/recommended_products_entity.dart';
import '../home_repo_interface/recommended_products_repo_interface.dart';

class GetRecommendedProductsUsecase
    implements UseCase<DataState<List<RecommendedProductsEntity>>, RecommendedParams> {
  RecommendedProductsRepositoryInterface reommenedProductsRepo;
  GetRecommendedProductsUsecase(this.reommenedProductsRepo);
  @override
  Future<DataState<List<RecommendedProductsEntity>>> call({required params}) {
    return reommenedProductsRepo.getRecommendedProductsByCategory(params.categoryId,params.limit,params.offset);
  }
}
class RecommendedParams {
  final int categoryId;
  final int offset;
  final int limit;

  RecommendedParams({
    required this.categoryId,
    required this.offset,
    required this.limit,
  });
}