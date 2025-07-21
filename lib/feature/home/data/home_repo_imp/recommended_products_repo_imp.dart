import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/network/data_state.dart';
import '../../domain/home_entities/recommended_products_entity.dart';
import '../../domain/home_repo_interface/recommended_products_repo_interface.dart';
import '../api_service/remote_data_source/product_apiService.dart';

class RecommendedProductsRepoImp
    extends RecommendedProductsRepositoryInterface {
  final ProductApiService productApiService;

  RecommendedProductsRepoImp(
    this.productApiService,
  );

  @override
  Future<DataState<List<RecommendedProductsEntity>>>
      getRecommendedProductsByCategory(int categoryId,int limit,int offset) async {
    try {
      final httpResponse =
          await productApiService.getRecommendedProductsByCategory(categoryId,limit,offset);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print("respons recommneded${httpResponse.data}");
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage ?? 'Unknown Error',
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      print('Error occurred during API call: ${e.message}');
      return DataFailed(e);
    }
  }
}
