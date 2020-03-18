import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/model/payee/payee_converter.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:provider/provider.dart';

class PayeeRepository {
  static SingleChildCloneableWidget buildProvider() =>
      ProxyProvider<DatabaseClient, PayeeRepository>(
        builder: (context, databaseClient, postRepository) =>
            PayeeRepository(databaseClient),
      );

  static PayeeRepository of(BuildContext context) =>
      Provider.of<PayeeRepository>(context);

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
