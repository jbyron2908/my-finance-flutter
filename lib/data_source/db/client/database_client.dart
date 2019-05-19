import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:my_finance_flutter/data_source/db/client/database_client_contract.dart';
import 'package:my_finance_flutter/data_source/db/model/post.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyFinanceDatabaseClient implements DatabaseClient {
  SqfliteAdapter _adapter;

  Map<String, dynamic> _references = {};

  var _postKey = "post";

  Future<void> setup() async {
    print("setup database - start");
    var dbPath = await getDatabasesPath();
    _adapter = new SqfliteAdapter(join(dbPath, "my_finance.db"));
    await _adapter.connect();
    await _initBeans();
    print("setup database - complete");
  }

  Future<void> _initBeans() async {
    print("create post table - start");
    var postBean = PostBean(_adapter);
    await postBean.createTable(ifNotExists: true);
    _references[_postKey] = postBean;
    print("create post table - success");
  }

  PostBean getPostBean() {
    return _references[_postKey] as PostBean;
  }
}
