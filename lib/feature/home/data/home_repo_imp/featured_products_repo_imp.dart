import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/network/data_state.dart';
import '../../domain/home_entities/featured_products_entity.dart';
import '../../domain/home_repo_interface/featured_products_repo_interface.dart';
import '../api_service/remote_data_source/product_apiService.dart';

class FeaturedProductsRepoImp extends FeaturedProductsRepositoryInterface{
  final ProductApiService productApiService;

  FeaturedProductsRepoImp(this.productApiService,);

  @override
  Future<DataState<List<FeaturedProductsEntity>>> getFeaturedProducts(  int limit,
  int offset) async{

    try {
      final httpResponse = await productApiService.getFeaturedProducts(limit: limit, offset:offset
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {

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