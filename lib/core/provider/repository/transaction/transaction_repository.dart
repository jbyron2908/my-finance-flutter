import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/model/transaction.dart';
import 'package:provider/provider.dart';

class TransactionRepository {
  static TransactionRepository of(BuildContext context) =>
      Provider.of<TransactionRepository>(context);

  TransactionRepository(this._databaseClient);

  DatabaseClient _databaseClient;

  TransactionEntityBean get _transactionBean {
    return _databaseClient.transactionBean;
  }

  Future<TransactionEntity> save(TransactionEntity transaction) async {
    return _transactionBean.upsert(transaction);
  }

  Future<List<TransactionEntity>> readAll() async {
    return await _transactionBean.getAll();
  }
}
