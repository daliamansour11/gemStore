import 'package:dio/dio.dart';
import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio});

  @override
  Future post(String path, {Map<String, dynamic>? body}) async {
    final response = await dio.post(path, data: body);
    return response;
  }
}
