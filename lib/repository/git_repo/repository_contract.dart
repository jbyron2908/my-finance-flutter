import 'package:my_finance_flutter/data_source/graphql/model/repository.dart'
    as graphql_model;
import 'package:my_finance_flutter/data_source/rest/model/repository.dart'
    as rest_model;

abstract class GitRepoRepository {
  Future<List<rest_model.Repository>> getRepositoryListRest(
      int page, int perPage);
  Future<List<graphql_model.Repository>> getRepositoryListGraphql(int limit);
}
