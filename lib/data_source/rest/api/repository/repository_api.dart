import 'package:my_finance_flutter/data_source/rest/client/rest_client.dart';
import 'package:my_finance_flutter/data_source/rest/model/repository.dart';

class RepositoryRestApi {
  MyFinanceRestClient _client;

  RepositoryRestApi(this._client);

  Future<List<Repository>> getRepositories(int page, int perPage) async {
    var queryParams = {"page": page, "per_page": perPage};
    var result = await _client.restClient
        .get("/user/repos", queryParameters: queryParams);

    return (result.data as List)
        .map((item) => Repository.fromJson(item))
        .toList();
  }
}
