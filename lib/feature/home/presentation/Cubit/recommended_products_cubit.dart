import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/data_state.dart';
import '../../../../core/network/error/error_handle.dart';
import '../../domain/home_entities/recommended_products_entity.dart';
import '../../domain/home_usecases/get_recommended_products_usecase.dart';
import 'recommended_products_state.dart';

class RecommendedProductsCubit extends Cubit<RecommendedProductsState> {
  final GetRecommendedProductsUsecase _getRecommendedProductsUsecase;
  int limit = 10;
  int offset = 0;
  bool hasMore = true;

  List<RecommendedProductsEntity> products = [];

  Timer? _debounce;

  RecommendedProductsCubit(this._getRecommendedProductsUsecase)
      : super(RecommendedProductsInitial());

  Future<void> getRecommendedProductsByCategory(
      {required int categoryId, bool isLoadMore = false}) async {
    if (!hasMore && isLoadMore) return;

    if (!isLoadMore) {
      offset = 0;
      hasMore = true;
      products.clear();
      if (!isClosed) emit(RecommendedProductsLoading());
    }

    try {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () async {
        final dataState = await _getRecommendedProductsUsecase(
          params: RecommendedParams(
              categoryId: categoryId, limit: limit, offset: offset),
        );

        if (dataState is DataSuccess<List<RecommendedProductsEntity>>) {
          final newItems = dataState.data ?? [];
          //print(products[0].category);
          print("fetched ${products.length}");
          if (newItems.length < limit) {
            hasMore = false;
          }

          products.addAll(newItems);
          offset += limit;
          if (!isClosed) emit(RecommendedProductsLoaded(products));
        } else if (dataState is DataFailed) {
          final errorMessage = getErrorMessage(dataState.error!);
          if (!isClosed) emit(RecommendedProductsError(errorMessage));
        }
      });
    } catch (e) {
      if (!isClosed) emit(RecommendedProductsError('Unexpected Error'));
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
