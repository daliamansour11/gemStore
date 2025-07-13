import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/data_state.dart';
import '../../../../core/network/error/error_handle.dart';
import '../../domain/home_entities/recommended_products_entity.dart';
import '../../domain/home_usecases/get_recommended_products_usecase.dart';
import 'recommended_products_state.dart';

class RecommendedProductsCubit extends Cubit<RecommendedProductsState> {
  final GetRecommendedProductsUsecase _getRecommendedProductsUsecase;

  List<RecommendedProductsEntity> products = [];

  Timer? _debounce;

  RecommendedProductsCubit(this._getRecommendedProductsUsecase)
      : super(RecommendedProductsInitial());

  Future<void> getRecommendedProductsByCategory(
      {required int categoryId}) async {
    try {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () async {
        if (!isClosed) emit(RecommendedProductsLoading());

        final dataState = await _getRecommendedProductsUsecase(
          params: categoryId,
        );

        if (dataState is DataSuccess<List<RecommendedProductsEntity>>) {
          products = dataState.data ?? [];

          print("fetched ${products.length}");
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
