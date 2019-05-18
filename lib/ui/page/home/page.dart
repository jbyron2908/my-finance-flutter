import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_finance_flutter/bloc/app/bloc.dart';
import 'package:my_finance_flutter/config/flavor/flavor.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/repository/git_repo/repository.dart';
import 'package:my_finance_flutter/repository/post/repository.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostRepository _postRepository;
  GitRepoRepository _gitRepoRepository;

  void _insertPost() async {
    await _postRepository.savePost("Pos", 10, true, DateTime.now());
  }

  void _readPosts() async {
    var list = await _postRepository.readAllPost();
    list.forEach((post) => print(post.toString()));
  }

  void _getRepositoriesGraphqlQuery() async {
    var repositoryList = await _gitRepoRepository.getRepositoryListGraphql(2);
    repositoryList.forEach((item) => print(item.toJson()));
  }

  void _getRepositoriesRestQuery() async {
    var repositoryList = await _gitRepoRepository.getRepositoryListRest(1, 2);
    repositoryList.forEach((item) => print(item.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    I18n i18n = I18n.of(context);
    var appBloc = BlocProvider.of<AppBloc>(context);
    _gitRepoRepository = appBloc.repositoryProvider.getGitRepoRepository();
    _postRepository = appBloc.repositoryProvider.getPostRepository();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(i18n.greetTo("Flutter")),
            Text(FlavorConfig.instance.name),
            RaisedButton(
              child: Text("Insert post"),
              onPressed: _insertPost,
            ),
            RaisedButton(
              child: Text("Read posts"),
              onPressed: _readPosts,
            ),
            RaisedButton(
              child: Text("GraphQL Query"),
              onPressed: _getRepositoriesGraphqlQuery,
            ),
            RaisedButton(
              child: Text("Rest call"),
              onPressed: _getRepositoriesRestQuery,
            ),
          ],
        ),
      ),
    );
  }
}
