import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/flavor/flavor.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repository.dart';
import 'package:my_finance_flutter/core/provider/repository/post/post_repository.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GitRepoRepository _gitRepoRepository;
  PostRepository _postRepository;
  DatabaseClient _databaseClient;

  void _goToCreateAccount() {
    AppRouter.navigateToCreateAccount(context);
  }

  void _insertPost() async {
    await _postRepository.savePost("Pos", 10, true, DateTime.now());
  }

  void _readPosts() async {
    var list = await _postRepository.readAllPost();
    list.forEach((post) => Log.i(post.toString()));
  }

  void _getRepositoriesGraphqlQuery() async {
    var repositoryList = await _gitRepoRepository.getRepositoryList(2);
    repositoryList.forEach((item) => Log.i(item.toJson()));
  }

  void _readUsers() async {
    var list = await _databaseClient.userBean.getAll();
    list.forEach((user) => Log.i("User: ${user.toJson()}"));
  }

  @override
  Widget build(BuildContext context) {
    I18n i18n = I18n.of(context);
    _gitRepoRepository = GitRepoRepository.of(context);
    _postRepository = PostRepository.of(context);
    _databaseClient = Provider.of<DatabaseClient>(context);

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
              child: Text("Insert post"),
              onPressed: _insertPost,
            ),
            RaisedButton(
              child: Text("Read posts"),
              onPressed: _readPosts,
            ),
            RaisedButton(
              child: Text("Read users"),
              onPressed: _readUsers,
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
