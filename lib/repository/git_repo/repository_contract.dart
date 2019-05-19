import 'package:my_finance_flutter/data_source/graphql/model/repository.dart'
    as graphqlModel;
import 'package:my_finance_flutter/data_source/rest/model/repository.dart'
    as restModel;

abstract class GitRepoRepository {
  Future<List<restModel.Repository>> getRepositoryListRest(
      int page, int perPage);
  Future<List<graphqlModel.Repository>> getRepositoryListGraphql(int limit);
}
