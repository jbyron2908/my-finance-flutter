import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_finance_flutter/core/data_source/api/client/api_client.dart';
import 'package:my_finance_flutter/core/data_source/api/model/repository.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/repository_query.dart';
import 'package:provider/provider.dart';

class RepositoryApi {
  static SingleChildCloneableWidget buildProvider() =>
      ProxyProvider<ApiClient, RepositoryApi>(
        builder: (context, apiClient, repositoryApi) =>
            RepositoryApi(apiClient.graphqlClient),
      );

  RepositoryApi(this._client);

  GraphQLClient _client;

  Future<List<Repository>> getRepositories(int limit) async {
    var queryResult = await _client.query(QueryOptions(
      documentNode: gql(getRepositoriesQuery),
      variables: <String, dynamic>{
        'limit': limit,
      },
    ));

    var list = queryResult.data["viewer"]["repositories"]["nodes"] as List;
    return list.map((item) => Repository.fromJson(item)).toList();
  }
}
