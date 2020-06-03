import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repo_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/import_csv_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/screen/account_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/screen/category_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/screen/label_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/screen/label_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/screen/operation_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/screen/payee_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/screen/playground_route.dart';
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
    ProfileListRoute().navigateIntoTab(context);
  }

  void goToAccountList(BuildContext context) {
    AccountListRoute().navigateIntoTab(context);
  }

  void goToCategoryList(BuildContext context) {
    CategoryListRoute().navigateIntoTab(context);
  }

  void goToOperationList(BuildContext context) {
    OperationListRoute().navigateIntoTab(context);
  }

  void goToPayeeList(BuildContext context) {
    PayeeListRoute().navigateIntoTab(context);
  }

  void goToPlayground(BuildContext context) {
    PlaygroundRoute().navigateIntoTab(context);
  }

  void goToLabelList(BuildContext context) {
    LabelListRoute().navigateIntoTab(context);
  }

  Future goToLabelListSelection(BuildContext context) async {
    var labelList = await LabelSelectionRoute().navigateIntoTab(context);
    Log.i(labelList);
  }

  void goToImportCsv(BuildContext context) {
    ImportCsvFormRoute().navigateIntoTab(context);
  }

  void getRepositoriesGraphqlQuery() async {
    var repositoryList = await gitRepoRepository.getRepositoryList(2);
    repositoryList.forEach((item) => Log.i(item.toJson()));
  }

  @override
  List<SingleChildWidget> get dependencies => [];
}
