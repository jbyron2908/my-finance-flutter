import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/payee/payee_converter.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
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

  final DatabaseClient _databaseClient;

  Stream<List<PayeeModel>> _payeeListStream;
  Stream<List<PayeeModel>> get payeeListStream => _payeeListStream;

  Future<PayeeModel> getOrAdd(String payeeName) async {
    return _databaseClient.payeeDao.getOrAdd(payeeName);
  }

  Future save(PayeeModel model) async {
    return _databaseClient.payeeDao.save(
      PayeeConverter.toEntity(model),
    );
  }

  Future delete(PayeeModel payee) async {
    return _databaseClient.payeeDao.markDelete(PayeeConverter.toEntity(payee));
  }
}
