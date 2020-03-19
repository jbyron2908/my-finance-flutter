import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/repository.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/account/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/category/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/operation/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/payee/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/profile/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/tag/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/tag/selection/screen/route.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class HomeBloc extends BaseBloc {
  static HomeBloc of(BuildContext context) =>
      Provider.of<HomeBloc>(context, listen: false);

  HomeBloc({
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
  List<SingleChildWidget> get dependencies => [];
}
