import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/data_state.dart';
import '../../../../core/network/error/error_handle.dart';
import '../../domain/home_entities/featured_products_entity.dart';
import '../../domain/home_usecases/get_featured_products_usecases.dart';

part 'featured_products_state.dart';

class FeaturedProductsCubit extends Cubit<FeaturedProductsState> {
  final GetFeaturedProductsUseCase _getFeaturedProductsUseCase;

  int limit = 10;
  int offset = 0;
  bool hasMore = true;

  List<FeaturedProductsEntity> products = [];

  FeaturedProductsCubit(this._getFeaturedProductsUseCase)
      : super(FeaturedProductsInitial());

  Future<void> fetchFeaturedProducts({bool isLoadMore = false}) async {
    if (isClosed) return;

    if (!hasMore && isLoadMore) return;

    if (!isLoadMore) {
      offset = 0;
      hasMore = true;
      products.clear();
      if (!isClosed) emit(FeaturedProductsLoading());
    }

    try {
      final dataState = await _getFeaturedProductsUseCase(
        params: PaginationParams(limit: limit, offset: offset),
      );

      if (dataState is DataSuccess<List<FeaturedProductsEntity>>) {
        final newItems = dataState.data ?? [];
        print("fetched1111 ${newItems.length}");

        if (newItems.length < limit) {
          hasMore = false;
        }

        products.addAll(newItems);
        offset += limit;

       products= mergeSort(List.from(products));
       print("fetched ${products.length}");
        // products =merge(products, newItems);
        if (!isClosed) emit(FeaturedProductsLoaded(List.from(products)));

      } else if (dataState is DataFailed) {
        final errorMessage = getErrorMessage(dataState.error!);
        if (!isClosed) emit(FeaturedProductsError(errorMessage));
      }
    } catch (e) {
      if (!isClosed) emit(FeaturedProductsError('Unexpected Error'));
    }
  }

  List<FeaturedProductsEntity> mergeSort(List<FeaturedProductsEntity> productsList) {
    if (productsList.length <= 1) return productsList;

    int middleIndex = productsList.length ~/ 2;

    List<FeaturedProductsEntity> leftList = mergeSort(productsList.sublist(0, middleIndex));
    List<FeaturedProductsEntity> rightList = mergeSort(productsList.sublist(middleIndex));

    return merge(leftList, rightList);
  }

  List<FeaturedProductsEntity> merge(
      List<FeaturedProductsEntity> leftList,
      List<FeaturedProductsEntity> rightList,
      ) {
    List<FeaturedProductsEntity> mergedList = [];
    int i = 0;
    int j = 0;

    while (i < leftList.length && j < rightList.length) {
      if (leftList[i].price! <= rightList[j].price!) {
        mergedList.add(leftList[i]);
        i++;
      } else {
        mergedList.add(rightList[j]);
        j++;
      }
    }

    while (i < leftList.length) {
      mergedList.add(leftList[i]);
      i++;
    }

    while (j < rightList.length) {
      mergedList.add(rightList[j]);
      j++;
    }

    return mergedList;
  }


}
