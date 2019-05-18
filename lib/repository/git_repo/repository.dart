import 'package:flutter/material.dart';
import 'package:my_finance_flutter/data_source/graphql/api/repository/repository_api.dart';
import 'package:my_finance_flutter/data_source/graphql/model/repository.dart' as graphqlModel;
import 'package:my_finance_flutter/data_source/rest/api/repository/repository_api.dart';
import 'package:my_finance_flutter/data_source/rest/model/repository.dart' as restModel;

class GitRepoRepository {
  RepositoryRestApi _repositoryRestApi;
  RepositoryGraphqlApi _repositoryGraphqlApi;

  GitRepoRepository(
      {@required RepositoryRestApi repositoryRestApi,
      @required RepositoryGraphqlApi repositoryGrapqhApi}) {
    _repositoryGraphqlApi = repositoryGrapqhApi;
    _repositoryRestApi = repositoryRestApi;
  }

  Future<List<restModel.Repository>> getRepositoryListRest(int page, int perPage) async {
    return await _repositoryRestApi.getRepositories(page, perPage);
  }

  Future<List<graphqlModel.Repository>> getRepositoryListGraphql(int limit) async {
    return await _repositoryGraphqlApi.getRepositories(limit);
  }
}
