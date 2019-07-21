import 'package:flutter/material.dart';
import 'package:my_finance_flutter/data_source/graphql/api/repository/repository_contract.dart';
import 'package:my_finance_flutter/data_source/graphql/model/repository.dart';
import 'package:my_finance_flutter/repository/git_repo/repository_contract.dart';

class MyFinanceGitRepoRepository implements GitRepoRepository {
  RepositoryGraphqlApi _repositoryGraphqlApi;

  MyFinanceGitRepoRepository(
      {@required RepositoryGraphqlApi repositoryGrapqhApi}) {
    _repositoryGraphqlApi = repositoryGrapqhApi;
  }

  @override
  Future<List<Repository>> getRepositoryListGraphql(int limit) async {
    return await _repositoryGraphqlApi.getRepositories(limit);
  }
}
