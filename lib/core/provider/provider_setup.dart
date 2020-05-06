import 'package:flutter/cupertino.dart';
import 'package:my_finance_flutter/core/constants/operation_state/operation_state_constants.dart';
import 'package:my_finance_flutter/core/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/data_source/api/client/api_client.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/repository_api.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/bookmark_operation/bookmark_operation_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/bookmark_operation/bookmark_operation_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repo_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/label/label_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/operation_state/operation_state_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/operation_type/operation_type_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/profile_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ...globalDependencies,
  ...dataSourceDependecies,
  ...repositoryDependecies
];

List<SingleChildWidget> globalDependencies = [
  ApiClient.buildProvider(),
  DatabaseClient.buildProvider(),
];

List<SingleChildWidget> dataSourceDependecies = [
  RepositoryApi.buildProvider(),
];

List<SingleChildWidget> repositoryDependecies = [
  GitRepoRepository.buildProvider(),
  ProfileRepository.buildProvider(),
  AccountRepository.buildProvider(),
  CategoryRepository.buildProvider(),
  OperationRepository.buildProvider(),
  BookmarkOperationRepository.buildProvider(),
  OperationTypeRepository.buildProvider(),
  OperationStateRepository.buildProvider(),
  PayeeRepository.buildProvider(),
  LabelRepository.buildProvider(),
];

List<SingleChildWidget> dataProviders(BuildContext context) => [
      StreamProvider<List<ProfileModel>>.value(
        value: ProfileRepository.of(context).profileListStream,
        initialData: [],
      ),
      StreamProvider<List<AccountModel>>.value(
        value: AccountRepository.of(context).accountListStream,
        initialData: [],
      ),
      StreamProvider<List<CategoryModel>>.value(
        value: CategoryRepository.of(context).categoryListStream,
        initialData: [],
      ),
      StreamProvider<List<BookmarkOperationModel>>.value(
        value:
            BookmarkOperationRepository.of(context).bookmarkOperationListStream,
        initialData: [],
      ),
      Provider<List<OperationTypeModel>>.value(
        value: OperationTypeConstants.operationTypeList,
      ),
      Provider<List<OperationStateModel>>.value(
        value: OperationStateConstants.operationStateList,
      ),
      StreamProvider<List<PayeeModel>>.value(
        value: PayeeRepository.of(context).payeeListStream,
        initialData: [],
      ),
      StreamProvider<List<LabelModel>>.value(
        value: LabelRepository.of(context).labelListStream,
        initialData: [],
      ),
    ];
