import 'package:flutter/material.dart';
import 'package:my_finance_flutter/data_source/graphql/api/repository/repository_contract.dart';
import 'package:my_finance_flutter/data_source/graphql/model/repository.dart'
    as graphqlModel;
import 'package:my_finance_flutter/data_source/rest/api/repository/repository_contract.dart';
import 'package:my_finance_flutter/data_source/rest/model/repository.dart'
    as restModel;
import 'package:my_finance_flutter/repository/git_repo/repository_contract.dart';

class MyFinanceGitRepoRepository implements GitRepoRepository {
  RepositoryRestApi _repositoryRestApi;
  RepositoryGraphqlApi _repositoryGraphqlApi;

  MyFinanceGitRepoRepository(
      {@required RepositoryRestApi repositoryRestApi,
      @required RepositoryGraphqlApi repositoryGrapqhApi}) {
    _repositoryGraphqlApi = repositoryGrapqhApi;
    _repositoryRestApi = repositoryRestApi;
  }

  @override
  Future<List<restModel.Repository>> getRepositoryListRest(
      int page, int perPage) async {
    return await _repositoryRestApi.getRepositories(page, perPage);
  }

  @override
  Future<List<graphqlModel.Repository>> getRepositoryListGraphql(
      int limit) async {
    return await _repositoryGraphqlApi.getRepositories(limit);
  }
}
