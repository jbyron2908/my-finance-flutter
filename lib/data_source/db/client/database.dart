import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:my_finance_flutter/data_source/db/model/post.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyFinanceDatabase {
  SqfliteAdapter _adapter;
  PostBean _postBean;

  Future<void> setup() async {
    print("setup database - start");
    var dbPath = await getDatabasesPath();
    _adapter = new SqfliteAdapter(join(dbPath, "my_finance.db"));
    await _adapter.connect();
    print("setup database - complete");
  }

  Future<PostBean> getPostBean() async {
    if (_postBean == null) {
      print("create post table - start");
      _postBean = PostBean(_adapter);
      await _postBean.createTable(ifNotExists: true);
      print("create post table - success");
    }
    return _postBean;
  }
}
