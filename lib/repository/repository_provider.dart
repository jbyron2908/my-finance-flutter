import 'package:my_finance_flutter/data_source/graphql/client/graphql_client.dart';
import 'package:my_finance_flutter/data_source/rest/client/rest_client.dart';
import 'package:my_finance_flutter/repository/git_repo/repository.dart';

class MyFinanceRepositoryProvider {
  MyFinanceGraphqlClient _graphqlClient;
  MyFinanceRestClient _restClient;

  Map<String, dynamic> _references = {};

  void setup(
      MyFinanceGraphqlClient graphqlClient, MyFinanceRestClient restClient) {
    _graphqlClient = graphqlClient;
    _restClient = restClient;
  }

  GitRepoRepository getGitRepoRepository() {
    var gitRepo = _references["git_repo"];

    if (gitRepo == null) {
      var gitRepoRepository = GitRepoRepository(
          repositoryGrapqhApi: _graphqlClient.getRepositoryApi(),
          repositoryRestApi: _restClient.getRepositoryApi());
      _references["git_repo"] = gitRepo;
      return gitRepoRepository;
    }

    return gitRepo as GitRepoRepository;
  }
}
