import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/payee/index.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PayeeRepository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, PayeeRepository>(
        update: (context, databaseClient, postRepository) =>
            PayeeRepository(databaseClient),
      );

  static PayeeRepository of(BuildContext context) =>
      Provider.of<PayeeRepository>(context, listen: false);

  PayeeRepository(this._databaseClient) {
    _payeeListStream = _databaseClient.payeeDao.watchAll();
  }

  DatabaseClient _databaseClient;

  Stream<List<PayeeModel>> _payeeListStream;
  Stream<List<PayeeModel>> get payeeListStream => _payeeListStream;

  Future<List<PayeeModel>> getAll() async {
    return _databaseClient.payeeDao.getAll();
  }

  Future<PayeeModel> getOrAdd(String payeeName) async {
    return _databaseClient.payeeDao.getOrAdd(payeeName);
  }

  Future<int> save(PayeeModel model) async {
    return _databaseClient.payeeDao.insert(
      PayeeConverter.toEntity(model),
    );
  }
}
