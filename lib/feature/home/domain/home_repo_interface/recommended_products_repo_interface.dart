import '../../../../core/network/data_state.dart';
import '../home_entities/recommended_products_entity.dart';

abstract class RecommendedProductsRepositoryInterface {
  Future<DataState<List<RecommendedProductsEntity>>>
      getRecommendedProductsByCategory(int categoryId);
}
