import 'package:flutter/cupertino.dart';
import 'package:my_finance_flutter/core/data_source/api/client/api_client.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/repository_api.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/provider/model/account/account_model.dart';
import 'package:my_finance_flutter/core/provider/model/category/category_model.dart';
import 'package:my_finance_flutter/core/provider/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/provider/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/provider/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/provider/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/provider/model/tag/tag_model.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/operation_type/operation_type_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/tag/tag_repository.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> appProviders = [
  ...globalDependencies,
  ...dataSourceDependecies,
  ...repositoryDependecies
];

List<SingleChildCloneableWidget> globalDependencies = [
  ApiClient.buildProvider(),
  DatabaseClient.buildProvider(),
];

List<SingleChildCloneableWidget> dataSourceDependecies = [
  RepositoryApi.buildProvider(),
];

List<SingleChildCloneableWidget> repositoryDependecies = [
  GitRepoRepository.buildProvider(),
  ProfileRepository.buildProvider(),
  AccountRepository.buildProvider(),
  CategoryRepository.buildProvider(),
  OperationRepository.buildProvider(),
  OperationTypeRepository.buildProvider(),
  PayeeRepository.buildProvider(),
  TagRepository.buildProvider(),
];

List<SingleChildCloneableWidget> dataProviders(BuildContext context) => [
      StreamProvider<List<ProfileModel>>.value(
        value: ProfileRepository.of(context).profileListStream,
        initialData: List(),
      ),
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
      Provider<List<OperationTypeModel>>.value(
        value: OperationTypeConstants.operationTypeList,
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
