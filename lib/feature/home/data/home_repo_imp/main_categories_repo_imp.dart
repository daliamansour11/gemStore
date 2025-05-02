import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/network/data_state.dart';
import '../../domain/home_entities/mainCategory_entity.dart';
import '../../domain/home_repo_interface/main_category_repo.dart';
import '../api_service/remote_data_source/main_category_api.dart';

class MainCategoriesRepoImp extends MainCategoryRepositoryInterface {
  final MainCategoryApiService mainCategoryApiService;

  MainCategoriesRepoImp(this.mainCategoryApiService);

  @override
  Future<DataState<List<MainCategoryEntity>>> getMainCategories() async {
    try {
      final httpResponse = await mainCategoryApiService.GetMainCategories();
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
      // print('Error occurred during API call: ${e.message}');
      return DataFailed(e);
    }
  }
}
