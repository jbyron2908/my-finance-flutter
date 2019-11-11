import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repository.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:my_finance_flutter/ui/view/account/account_list/screen/account_list_route.dart';
import 'package:my_finance_flutter/ui/view/category/category_list/screen/category_list_route.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/screen/import_form_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_list/operation_list_route.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_list/payee_list_route.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_list/tag_list_route.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_selection/tag_selection_route.dart';
import 'package:provider/src/provider.dart';

class HomeBloc extends BaseBloc {
  static HomeBloc of(BuildContext context) => Provider.of<HomeBloc>(context);

  HomeBloc({
    this.gitRepoRepository,
  });

  final GitRepoRepository gitRepoRepository;

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

  void goToTagList(BuildContext context) {
    AppRouter.navigateTo(context, TagListRoute());
  }

  Future goToTagListSelection(BuildContext context) async {
    var tagList = await AppRouter.navigateTo(context, TagSelectionRoute());
    Log.i(tagList);
  }

  void goToImportCsv(BuildContext context) {
    AppRouter.navigateTo(context, ImportCsvFormRoute());
  }

  void getRepositoriesGraphqlQuery() async {
    var repositoryList = await gitRepoRepository.getRepositoryList(2);
    repositoryList.forEach((item) => Log.i(item.toJson()));
  }

  @override
  List<SingleChildCloneableWidget> get dependencies => [];
}
