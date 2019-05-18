import 'package:my_finance_flutter/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client.dart';
import 'package:my_finance_flutter/data_source/rest/client/rest_client.dart';
import 'package:my_finance_flutter/repository/git_repo/repository.dart';
import 'package:my_finance_flutter/repository/post/repository.dart';

class MyFinanceRepositoryProvider {
  MyFinanceGraphqlClient _graphqlClient;
  MyFinanceRestClient _restClient;
  MyFinanceDatabase _database;

  Map<String, dynamic> _references = {};

  void setup(
      MyFinanceGraphqlClient graphqlClient, MyFinanceRestClient restClient, MyFinanceDatabase database) {
    _graphqlClient = graphqlClient;
    _restClient = restClient;
    _database = database;
  }

  GitRepoRepository getGitRepoRepository() {
    var key = "git_repo";
    var gitRepo = _references[key];

    if (gitRepo == null) {
      var gitRepo = GitRepoRepository(
          repositoryGrapqhApi: _graphqlClient.getRepositoryApi(),
          repositoryRestApi: _restClient.getRepositoryApi());
      _references[key] = gitRepo;
    }

    return gitRepo as GitRepoRepository;
  }

  PostRepository getPostRepository() {
    var key = "post_repo";
    var postRepository = _references[key];

    if (postRepository == null) {
      postRepository = PostRepository(postBean: _database.getPostBean());
      _references[key] = postRepository;
    }

    return postRepository as PostRepository;
  }
}
