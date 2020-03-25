import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repo_repository.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/import_csv_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/screen/account_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/screen/category_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/screen/label_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/screen/label_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/screen/operation_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/screen/payee_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/screen/profile_list_route.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class EntityListBloc extends BaseBloc {
  static EntityListBloc of(BuildContext context) =>
      Provider.of<EntityListBloc>(context, listen: false);

  EntityListBloc({
    this.gitRepoRepository,
  });

  final GitRepoRepository gitRepoRepository;

  void goToProfileList(BuildContext context) {
    AppRouter.navigateTo(context, ProfileListRoute());
  }

  void goToAccountList(BuildContext context) {
    AppRouter.navigateTo(context, AccountListRoute());
  }

  void goToCategoryList(BuildContext context) {
    AppRouter.navigateTo(context, CategoryListRoute());
  }

  void goToOperationList(BuildContext context) {
    AppRouter.navigateTo(context, OperationListRoute());
  }

  void goToPayeeList(BuildContext context) {
    AppRouter.navigateTo(context, PayeeListRoute());
  }

  void goToLabelList(BuildContext context) {
    AppRouter.navigateTo(context, LabelListRoute());
  }

  Future goToLabelListSelection(BuildContext context) async {
    var labelList = await AppRouter.navigateTo(context, LabelSelectionRoute());
    Log.i(labelList);
  }

  void goToImportCsv(BuildContext context) {
    AppRouter.navigateTo(context, ImportCsvFormRoute());
  }

  void getRepositoriesGraphqlQuery() async {
    var repositoryList = await gitRepoRepository.getRepositoryList(2);
    repositoryList.forEach((item) => Log.i(item.toJson()));
  }

  @override
  List<SingleChildWidget> get dependencies => [];
}
