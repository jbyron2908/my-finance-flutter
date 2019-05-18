import 'package:dio/dio.dart';
import 'package:my_finance_flutter/data_source/rest/model/repository.dart';

class RepositoryRestApi {
  Dio _client;

  RepositoryRestApi(this._client);

  Future<List<Repository>> getRepositories(int page, int perPage) async {
    var queryParams = {"page": page, "per_page": perPage};
    var result = await _client.get("/user/repos", queryParameters: queryParams);

    return (result.data as List)
        .map((item) => Repository.fromJson(item))
        .toList();
  }
}
