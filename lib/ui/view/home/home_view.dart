import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/flavor/flavor.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repository.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/view/account/account_list/account_list_route.dart';
import 'package:my_finance_flutter/ui/view/category/category_list/category_list_route.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/import_form_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_list/operation_list_route.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_list/payee_list_route.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_list/tag_list_route.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_selection/tag_selection_route.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GitRepoRepository _gitRepoRepository;

  void _goToAccountList() {
    AppRouter.navigateTo(context, AccountListRoute());
  }

  void _goToCategoryList() {
    AppRouter.navigateTo(context, CategoryListRoute());
  }

  void _goToOperationList() {
    OperationListRoute.navigateTo(context);
  }

  void _goToPayeeList() {
    PayeeListRoute.navigateTo(context);
  }

  void _goToTagList() {
    TagListRoute.navigateTo(context);
  }

  Future _goToTagListSelection() async {
    var tagList = await TagSelectionRoute.navigateTo(context);
    Log.i(tagList);
  }

  void _goToImportCsv() {
    AppRouter.navigateTo(context, ImportCsvFormRoute());
  }

  void _getRepositoriesGraphqlQuery() async {
    var repositoryList = await _gitRepoRepository.getRepositoryList(2);
    repositoryList.forEach((item) => Log.i(item.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    I18n i18n = I18n.of(context);
    _gitRepoRepository = GitRepoRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(i18n.greetTo("Flutter")),
            Text(Flavor.type.toString()),
            RaisedButton(
              child: Text("List Accounts"),
              onPressed: _goToAccountList,
            ),
            RaisedButton(
              child: Text("List Categories"),
              onPressed: _goToCategoryList,
            ),
            RaisedButton(
              child: Text("List Operations"),
              onPressed: _goToOperationList,
            ),
            RaisedButton(
              child: Text("List Payees"),
              onPressed: _goToPayeeList,
            ),
            RaisedButton(
              child: Text("List Tags"),
              onPressed: _goToTagList,
            ),
            RaisedButton(
              child: Text("Select Tags"),
              onPressed: _goToTagListSelection,
            ),
            RaisedButton(
              child: Text("Import CSV"),
              onPressed: _goToImportCsv,
            ),
            RaisedButton(
              child: Text("GraphQL Query"),
              onPressed: _getRepositoriesGraphqlQuery,
            ),
          ],
        ),
      ),
    );
  }
}
