import 'package:dio/dio.dart';
import 'package:my_finance_flutter/data_source/rest/api/repository/repository_contract.dart';
import 'package:my_finance_flutter/data_source/rest/model/repository.dart';

class MyFinanceRepositoryRestApi implements RepositoryRestApi {
  Dio _client;

  MyFinanceRepositoryRestApi(this._client);

  @override
  Future<List<Repository>> getRepositories(int page, int perPage) async {
    var queryParams = {"page": page, "per_page": perPage};
    var result = await _client.get("/user/repos", queryParameters: queryParams);

    return (result.data as List)
        .map((item) => Repository.fromJson(item))
        .toList();
  }
}
