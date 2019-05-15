import 'package:flutter/material.dart';
import 'package:my_finance_flutter/config/flavor/flavor.dart';
import 'package:my_finance_flutter/data_source/db/config/database.dart';
import 'package:my_finance_flutter/data_source/db/models/post.dart';
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
  Database database;
  
  void _insertPost() async {
    var postBean = await database.getPostBean();
    postBean.insert(Post.make("Pos", 10, true, DateTime.now()));
  }

  void _readPosts() async {
    var postBean = await database.getPostBean();
    var list = await postBean.getAll();
    list.forEach((post) => print(post.toString()));
  }

  @override
  Widget build(BuildContext context) {
    S i18n = S.of(context);
    database = BlocProvider.of<AppBloc>(context).database;

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
          ],
        ),
      ),
    );
  }
}
