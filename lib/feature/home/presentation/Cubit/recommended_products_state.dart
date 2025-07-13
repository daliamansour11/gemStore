import '../../domain/home_entities/recommended_products_entity.dart';

abstract class RecommendedProductsState {}

class RecommendedProductsInitial extends RecommendedProductsState {}

class RecommendedProductsLoading extends RecommendedProductsState {}

class RecommendedProductsLoaded extends RecommendedProductsState {
  final List<RecommendedProductsEntity> products;
  RecommendedProductsLoaded(this.products);
}

class RecommendedProductsError extends RecommendedProductsState {
  final String message;
  RecommendedProductsError(this.message);
}
