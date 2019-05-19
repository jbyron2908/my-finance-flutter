import 'package:my_finance_flutter/data_source/db/client/database_client_contract.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client_contract.dart';
import 'package:my_finance_flutter/data_source/rest/client/rest_client_contract.dart';
import 'package:my_finance_flutter/repository/git_repo/repository.dart';
import 'package:my_finance_flutter/repository/git_repo/repository_contract.dart';
import 'package:my_finance_flutter/repository/post/repository.dart';
import 'package:my_finance_flutter/repository/post/repository_contract.dart';
import 'package:my_finance_flutter/repository/repository_provider_contract.dart';

class MyFinanceRepositoryProvider implements RepositoryProvider {
  GraphQLClient _graphqlClient;
  RestClient _restClient;
  DatabaseClient _database;

  Map<String, dynamic> _references = {};

  @override
  void setup(GraphQLClient graphqlClient, RestClient restClient,
      DatabaseClient database) {
    _graphqlClient = graphqlClient;
    _restClient = restClient;
    _database = database;
  }

  @override
  GitRepoRepository getGitRepoRepository() {
    var key = "git_repo";
    var gitRepo = _references[key];

    if (gitRepo == null) {
      gitRepo = MyFinanceGitRepoRepository(
          repositoryGrapqhApi: _graphqlClient.getRepositoryApi(),
          repositoryRestApi: _restClient.getRepositoryApi());
      _references[key] = gitRepo;
    }

    return gitRepo as GitRepoRepository;
  }

  @override
  PostRepository getPostRepository() {
    var key = "post_repo";
    var postRepository = _references[key];

    if (postRepository == null) {
      postRepository =
          MyFinancePostRepository(postBean: _database.getPostBean());
      _references[key] = postRepository;
    }

    return postRepository as PostRepository;
  }
}
