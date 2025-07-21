abstract class ApiConsumer {
  Future<dynamic> post(String path, {Map<String, dynamic>? body});
}
