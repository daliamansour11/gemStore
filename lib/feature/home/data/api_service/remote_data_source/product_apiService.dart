import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants/end_points.dart';
import '../../model/featured_products.dart';

part 'product_apiService.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET('/products')
  Future<HttpResponse<List<FeaturedProductsModel>>> getFeaturedProducts({
    @Query('limit') required int limit,
    @Query('offset') required int offset,
  });

}
