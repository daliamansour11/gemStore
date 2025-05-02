
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants/end_points.dart';
import '../../../domain/home_entities/mainCategory_entity.dart';


part 'main_category_api.g.dart';
@RestApi(baseUrl: baseUrl)

abstract class MainCategoryApiService {


  factory MainCategoryApiService(Dio dio) = _MainCategoryApiService;

  
  @GET('/categories')
  Future<HttpResponse<List<MainCategoryEntity>>> GetMainCategories( );
}

