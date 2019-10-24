import 'package:flutter/cupertino.dart';
import 'package:my_finance_flutter/core/data_source/api/client/api_client.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/repository_api.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/app/app_state.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/core/provider/model/operation_model.dart';
import 'package:my_finance_flutter/core/provider/model/payee_model.dart';
import 'package:my_finance_flutter/core/provider/model/tag_model.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/tag/tag_repository.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> appProviders = [
  ...globalDependencies,
  ...dataSourceDependecies,
  ...repositoryDependecies
];

List<SingleChildCloneableWidget> globalDependencies = [
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
  ProxyProvider<DatabaseClient, PayeeRepository>(
    builder: (context, databaseClient, postRepository) =>
        PayeeRepository(databaseClient),
  ),
  ProxyProvider<DatabaseClient, TagRepository>(
    builder: (context, databaseClient, postRepository) =>
        TagRepository(databaseClient),
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
      StreamProvider<List<OperationModel>>.value(
        value: OperationRepository.of(context).operationListStream,
        initialData: List(),
      ),
      StreamProvider<List<PayeeModel>>.value(
        value: PayeeRepository.of(context).payeeListStream,
        initialData: List(),
      ),
      StreamProvider<List<TagModel>>.value(
        value: TagRepository.of(context).tagListStream,
        initialData: List(),
      ),
    ];
