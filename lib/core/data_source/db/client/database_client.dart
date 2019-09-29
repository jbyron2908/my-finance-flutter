import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/core/data_source/db/model/post.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  SqfliteAdapter _adapter;

  Map<String, dynamic> _references = {};

  var _postKey = "post";

  Future<void> setup() async {
    Log.i("setup database - start");
    var dbPath = await getDatabasesPath();
    _adapter = SqfliteAdapter(join(dbPath, "my_finance.db"));
    await _adapter.connect();
    await _initBeans();
    Log.i("setup database - complete");
  }

  Future<void> _initBeans() async {
    Log.i("create post table - start");
    var postBean = PostBean(_adapter);
    await postBean.createTable(ifNotExists: true);
    _references[_postKey] = postBean;
    Log.i("create post table - success");
  }

  PostBean getPostBean() {
    return _references[_postKey] as PostBean;
  }
}
