import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/flavor/flavor.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
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
  AccountRepository _accountRepository;

  void _goToCreateAccount() {
    AppRouter.navigateToCreateAccount(context);
  }

  void _getRepositoriesGraphqlQuery() async {
    var repositoryList = await _gitRepoRepository.getRepositoryList(2);
    repositoryList.forEach((item) => Log.i(item.toJson()));
  }

  void _readAccounts() async {
    var accountList = await _accountRepository.readAll();
    Log.i(accountList);
    // accountList.forEach((item) => Log.i(item.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    I18n i18n = I18n.of(context);
    _gitRepoRepository = GitRepoRepository.of(context);
    _accountRepository = AccountRepository.of(context);

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
              child: Text("Create Account"),
              onPressed: _goToCreateAccount,
            ),
            RaisedButton(
              child: Text("Read Accounts"),
              onPressed: _readAccounts,
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
