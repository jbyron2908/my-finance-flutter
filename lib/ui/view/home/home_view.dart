import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/flavor/flavor.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repository.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GitRepoRepository _gitRepoRepository;

  void _goToAccountList() {
    AppRouter.navigateToAccountList(context);
  }

  void _goToCategoryList() {
    AppRouter.navigateToCategoryList(context);
  }

  void _goToOperationList() {
    AppRouter.navigateToOperationList(context);
  }

  void _goToPayeeList() {
    AppRouter.navigateToPayeeList(context);
  }

  void _goToTagList() {
    AppRouter.navigateToTagList(context);
  }

  Future _goToTagListSelection() async {
    var tagList = await AppRouter.navigateToTagSelection(context);
    Log.i(tagList);
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
              child: Text("GraphQL Query"),
              onPressed: _getRepositoriesGraphqlQuery,
            ),
          ],
        ),
      ),
    );
  }
}
