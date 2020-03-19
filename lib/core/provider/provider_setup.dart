import 'package:flutter/cupertino.dart';
import 'package:my_finance_flutter/core/constants/operation_state/constants.dart';
import 'package:my_finance_flutter/core/constants/operation_type/constants.dart';
import 'package:my_finance_flutter/core/data_source/api/client/client.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/api.dart';
import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/model/account/model.dart';
import 'package:my_finance_flutter/core/model/category/model.dart';
import 'package:my_finance_flutter/core/model/operation/model.dart';
import 'package:my_finance_flutter/core/model/operation/state_model.dart';
import 'package:my_finance_flutter/core/model/operation/type_model.dart';
import 'package:my_finance_flutter/core/model/payee/model.dart';
import 'package:my_finance_flutter/core/model/profile/model.dart';
import 'package:my_finance_flutter/core/model/tag/model.dart';
import 'package:my_finance_flutter/core/provider/repository/account/repository.dart';
import 'package:my_finance_flutter/core/provider/repository/category/repository.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/repository.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/repository.dart';
import 'package:my_finance_flutter/core/provider/repository/operation_state/repository.dart';
import 'package:my_finance_flutter/core/provider/repository/operation_type/repository.dart';
import 'package:my_finance_flutter/core/provider/repository/payee/repository.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/repository.dart';
import 'package:my_finance_flutter/core/provider/repository/tag/repository.dart';
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
  OperationTypeRepository.buildProvider(),
  OperationStateRepository.buildProvider(),
  PayeeRepository.buildProvider(),
  TagRepository.buildProvider(),
];

List<SingleChildWidget> dataProviders(BuildContext context) => [
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
      Provider<List<OperationStateModel>>.value(
        value: OperationStateConstants.operationStateList,
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
