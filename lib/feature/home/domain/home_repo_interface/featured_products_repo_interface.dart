


import '../../../../core/network/data_state.dart';
import '../home_entities/featured_products_entity.dart';

abstract class FeaturedProductsRepositoryInterface{
  Future<DataState<List<FeaturedProductsEntity>>> getFeaturedProducts();

}