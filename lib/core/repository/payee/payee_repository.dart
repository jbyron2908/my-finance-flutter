import 'package:get/get.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/payee/payee_converter.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';

class PayeeRepository {
  final DatabaseClient _databaseClient = Get.find();

  PayeeRepository() {
    _payeeListStream = _databaseClient.payeeDao.watchAll();
  }

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

  Future clearAll() {
    return _databaseClient.payeeDao.clearAll();
  }
}
