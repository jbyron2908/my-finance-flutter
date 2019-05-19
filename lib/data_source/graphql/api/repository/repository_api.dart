import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_finance_flutter/data_source/graphql/api/repository/repository_contract.dart';
import 'package:my_finance_flutter/data_source/graphql/api/repository/repository_query.dart';
import 'package:my_finance_flutter/data_source/graphql/model/repository.dart';

class MyFinanceRepositoryGraphqlApi implements RepositoryGraphqlApi {
  GraphQLClient _client;

  MyFinanceRepositoryGraphqlApi(this._client);

  @override
  Future<List<Repository>> getRepositories(int limit) async {
    var queryResult = await _client.query(QueryOptions(
        document: getRepositoriesQuery,
        variables: <String, dynamic>{
          'limit': limit,
        }));

    var list = queryResult.data["viewer"]["repositories"]["nodes"] as List;
    return list.map((item) => Repository.fromJson(item)).toList();
  }
}
