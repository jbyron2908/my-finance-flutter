import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/api/entity/repository.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/repository_api.dart';
import 'package:provider/provider.dart';

class GitRepoRepository {
  static SingleChildCloneableWidget buildProvider() =>
      ProxyProvider<RepositoryApi, GitRepoRepository>(
        builder: (context, repositoryApi, gitRepoRepository) =>
            GitRepoRepository(repositoryApi),
      );

  static GitRepoRepository of(BuildContext context) =>
      Provider.of<GitRepoRepository>(context);

  GitRepoRepository(this._repositoryApi);

  RepositoryApi _repositoryApi;

  Future<List<Repository>> getRepositoryList(int limit) async {
    return await _repositoryApi.getRepositories(limit);
  }
}
