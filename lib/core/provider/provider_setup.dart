import 'package:flutter/cupertino.dart';
import 'package:my_finance_flutter/core/data_source/api/client/api_client.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/repository_api.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/app/app_setup.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> appProviders = [
  ...globalDependencies,
  ...dataSourceDependecies,
  ...repositoryDependecies
];

List<SingleChildCloneableWidget> globalDependencies = [
  Provider.value(value: ApiClient()),
  Provider.value(value: DatabaseClient()),
  ChangeNotifierProxyProvider<DatabaseClient, AppSetup>(
    builder: (context, databaseClient, appState) => AppSetup(databaseClient),
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
  ProxyProvider<DatabaseClient, CategoryRepository>(
    builder: (context, databaseClient, postRepository) =>
        CategoryRepository(databaseClient),
  ),
  ProxyProvider<DatabaseClient, AccountRepository>(
    builder: (context, databaseClient, postRepository) =>
        AccountRepository(databaseClient),
  ),
  ProxyProvider<DatabaseClient, OperationRepository>(
    builder: (context, databaseClient, postRepository) =>
        OperationRepository(databaseClient),
  ),
];

List<SingleChildCloneableWidget> dataProviders(BuildContext context) => [
      StreamProvider<List<AccountModel>>.value(
        value: AccountRepository.of(context).accountListStream,
        initialData: List(),
      ),
      StreamProvider<List<CategoryModel>>.value(
        value: CategoryRepository.of(context).categoryListStream,
        initialData: List(),
      ),
    ];
