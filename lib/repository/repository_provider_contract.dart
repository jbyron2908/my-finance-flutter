import 'package:my_finance_flutter/data_source/db/client/database_client_contract.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client_contract.dart';
import 'package:my_finance_flutter/repository/git_repo/repository_contract.dart';
import 'package:my_finance_flutter/repository/post/repository_contract.dart';

abstract class RepositoryProvider {
  void setup(GraphQLClient graphqlClient, DatabaseClient database);
  GitRepoRepository getGitRepoRepository();
  PostRepository getPostRepository();
}
