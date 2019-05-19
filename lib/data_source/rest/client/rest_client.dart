import 'package:dio/dio.dart';
import 'package:my_finance_flutter/data_source/rest/api/repository/repository_api.dart';
import 'package:my_finance_flutter/data_source/rest/api/repository/repository_contract.dart';
import 'package:my_finance_flutter/data_source/rest/client/rest_client_contract.dart';

class MyFinanceRestClient implements RestClient {
  static var _token = "";

  static final _baseUrl = "https://api.github.com";

  Dio _restClient;

  InterceptorsWrapper authInterceptor =
      InterceptorsWrapper(onRequest: (RequestOptions options) {
    options.headers = {"Authorization": "Bearer $_token"};
    return options;
  });

  @override
  void setup() {
    print("Setup RestClient - Start");

    BaseOptions options = new BaseOptions(
      baseUrl: _baseUrl,
    );
    _restClient = new Dio(options);

    _restClient.interceptors.add(authInterceptor);

    print("Setup RestClient - Complete");
  }

  @override
  RepositoryRestApi getRepositoryApi() {
    return MyFinanceRepositoryRestApi(_restClient);
  }
}
