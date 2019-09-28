import 'package:my_finance_flutter/core/data_source/api/client/api_client.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/repository_api.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/app/app_state.dart';
import 'package:my_finance_flutter/core/provider/navigation/app_router.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/post/post_repository.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> appProviders = [
  ...globalDependencies,
  ...dataSourceDependecies,
  ...repositoryDependecies,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> globalDependencies = [
  Provider.value(value: AppRouter()),
  Provider.value(value: ApiClient()),
  Provider.value(value: DatabaseClient()),
  ChangeNotifierProxyProvider<DatabaseClient, AppState>(
    builder: (context, databaseClient, appState) => AppState(databaseClient),
  )
];

List<SingleChildCloneableWidget> dataSourceDependecies = [
  ProxyProvider<ApiClient, RepositoryApi>(
    builder: (context, apiClient, repositoryApi) =>
        RepositoryApi(apiClient.graphqlClient),
  ),
];

List<SingleChildCloneableWidget> repositoryDependecies = [
  ProxyProvider<RepositoryApi, GitRepoRepository>(
    builder: (context, repositoryApi, gitRepoRepository) =>
        GitRepoRepository(repositoryApi),
  ),
  ProxyProvider<DatabaseClient, PostRepository>(
    builder: (context, databaseClient, postRepository) =>
        PostRepository(databaseClient),
  ),
];

List<SingleChildCloneableWidget> uiConsumableProviders = [];
