/// API client abstraction point.
/// Place Dio/http setup, interceptors, and auth headers here.
class ApiClient {
  ApiClient({required this.baseUrl});

  final String baseUrl;

  Future<Map<String, dynamic>> get(String path) async {
    // TODO: Connect to real HTTP client.
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    // TODO: Connect to real HTTP client.
    throw UnimplementedError();
  }
}
