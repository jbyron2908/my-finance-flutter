import 'package:flutter/material.dart';
import 'package:my_finance_flutter/config/flavor/flavor.dart';
import 'package:my_finance_flutter/data_source/db/config/database.dart';
import 'package:my_finance_flutter/data_source/db/models/post.dart';
import 'package:my_finance_flutter/generated/i18n.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _index = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _setupDatabase() async {
    Database.instance.setup();
  }

  void _insertPost() async {
    var postBean = await Database.instance.getPostBean();
    postBean
        .insert(Post.make("Post $_index", 10, true, DateTime.now()));
  }

  void _readPosts() async {
    var postBean = await Database.instance.getPostBean();
    var list = await postBean.getAll();
    list.forEach(
      (post) => print(post.toString())
    );
  }

  @override
  Widget build(BuildContext context) {
    I18n i18n = I18n.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(i18n.greetTo("Flutter")),
            Text(FlavorConfig.instance.name),
            RaisedButton(
              child: Text("Setup database"),
              onPressed: _setupDatabase,
            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
