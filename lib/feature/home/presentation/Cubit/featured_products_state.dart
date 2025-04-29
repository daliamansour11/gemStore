part of 'featured_products_cubit.dart';




abstract class FeaturedProductsState {}

class FeaturedProductsInitial extends FeaturedProductsState {}

class FeaturedProductsLoading extends FeaturedProductsState {}

class FeaturedProductsLoaded extends FeaturedProductsState {
  final List<FeaturedProductsEntity> products;
  FeaturedProductsLoaded(this.products);
}

class FeaturedProductsError extends FeaturedProductsState {
  final String message;
  FeaturedProductsError(this.message);
}
