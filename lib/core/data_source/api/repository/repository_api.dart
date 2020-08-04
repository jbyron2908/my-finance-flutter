import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_finance_flutter/core/data_source/api/client/api_client.dart';
import 'package:my_finance_flutter/core/data_source/api/entity/repository_entity.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/repository_query.dart';

class RepositoryApi {
  final ApiClient _client = Get.find();

  Future<List<Repository>> getRepositories(int limit) async {
    var queryResult = await _client.graphqlClient.query(QueryOptions(
      documentNode: gql(getRepositoriesQuery),
      variables: <String, dynamic>{
        'limit': limit,
      },
    ));

    var list = queryResult.data['viewer']['repositories']['nodes'] as List;
    return list.map((item) => Repository.fromJson(item)).toList();
  }
}
