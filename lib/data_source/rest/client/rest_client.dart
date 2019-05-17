import 'package:dio/dio.dart';

class MyFinanceRestClient {
  static final _token =

  static final _baseUrl = "https://api.github.com";

  Dio restClient;

  InterceptorsWrapper authInterceptor =
      InterceptorsWrapper(onRequest: (RequestOptions options) {
    options.headers = {"Authorization": "Bearer $_token"};
    return options;
  });

  void setup() {
    print("Setup RestClient - Start");

    BaseOptions options = new BaseOptions(
      baseUrl: _baseUrl,
    );
    restClient = new Dio(options);

    restClient.interceptors.add(authInterceptor);

    print("Setup RestClient - Complete");
  }
}
