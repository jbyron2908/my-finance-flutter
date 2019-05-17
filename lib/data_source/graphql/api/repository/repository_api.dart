import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client.dart';
import 'package:my_finance_flutter/data_source/graphql/model/repository.dart';
import 'package:my_finance_flutter/data_source/graphql/api/repository/repository_query.dart';

class RepositoryGraphqlApi {
  MyFinanceGraphqlClient _client;

  RepositoryGraphqlApi(this._client);

  Future<List<Repository>> getRepositories(int limit) async {
    var queryResult = await _client.graphqlClient.query(QueryOptions(
        document: getRepositoriesQuery,
        variables: <String, dynamic>{
          'limit': limit,
        }));

    var list = queryResult.data["viewer"]["repositories"]["nodes"] as List;
    return list.map((item) => Repository.fromJson(item)).toList();
  }
}
