import 'package:flutter/material.dart';
import 'package:my_finance_flutter/config/flavor/flavor.dart';
import 'package:my_finance_flutter/data_source/db/client/database.dart';
import 'package:my_finance_flutter/data_source/db/model/post.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_finance_flutter/bloc/app/bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyFinanceDatabase _databaseClient;
  MyFinanceGraphqlClient _graphqlClient;
  
  void _insertPost() async {
    var postBean = await _databaseClient.getPostBean();
    postBean.insert(Post.make("Pos", 10, true, DateTime.now()));
  }

  void _readPosts() async {
    var postBean = await _databaseClient.getPostBean();
    var list = await postBean.getAll();
    list.forEach((post) => print(post.toString()));
  }

  void _graphqlQuery() async {
    var queryResult = await _graphqlClient.query();
    print(queryResult.data); 
  }

  @override
  Widget build(BuildContext context) {
    I18n i18n = I18n.of(context);
    var appBloc = BlocProvider.of<AppBloc>(context);
    _databaseClient = appBloc.databaseClient;
    _graphqlClient = appBloc.graphqlClient;

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
              onPressed: _graphqlQuery,
            ),
          ],
        ),
      ),
    );
  }
}
