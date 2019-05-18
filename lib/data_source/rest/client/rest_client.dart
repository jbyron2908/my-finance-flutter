import 'package:dio/dio.dart';
import 'package:my_finance_flutter/data_source/rest/api/repository/repository_api.dart';

class MyFinanceRestClient {
  static var _token = "";

  static final _baseUrl = "https://api.github.com";

  Dio _restClient;

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
    _restClient = new Dio(options);

    _restClient.interceptors.add(authInterceptor);

    print("Setup RestClient - Complete");
  }

  RepositoryRestApi getRepositoryApi() {
    return RepositoryRestApi(_restClient);
  }
}
