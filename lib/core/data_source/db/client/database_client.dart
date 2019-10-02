import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';
import 'package:my_finance_flutter/core/data_source/db/model/category.dart';
import 'package:my_finance_flutter/core/data_source/db/model/post.dart';
import 'package:my_finance_flutter/core/data_source/db/model/transaction.dart';
import 'package:my_finance_flutter/core/data_source/db/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  SqfliteAdapter _adapter;

  PostBean postBean;
  UserEntityBean userBean;
  CategoryEntityBean categoryBean;
  TransactionEntityBean transactionBean;
  AccountEntityBean accountBean;

  Future<void> setup() async {
    var dbPath = await getDatabasesPath();
    _adapter = SqfliteAdapter(join(dbPath, "my_finance.db"));
    await _adapter.connect();
    await _initBeans();
  }

  Future<void> _initBeans() async {
    postBean = PostBean(_adapter);
    await postBean.createTable(ifNotExists: true);

    transactionBean = TransactionEntityBean(_adapter);
    await transactionBean.createTable(ifNotExists: true);

    accountBean = AccountEntityBean(_adapter);
    await accountBean.createTable(ifNotExists: true);

    categoryBean = CategoryEntityBean(_adapter);
    await categoryBean.createTable(ifNotExists: true);

    userBean = UserEntityBean(_adapter);
    await userBean.createTable(ifNotExists: true);
    var users = await userBean.getAll();
    if (users.isEmpty) {
      await userBean.insert(UserEntity.make("Byron"));
    }
  }
}
