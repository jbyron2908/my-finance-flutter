import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/repository/payee/payee_repository.dart';

class PayeePopulateController extends GetxController {
  final PayeeRepository _payeeRepository = Get.find();

  Future<void> clearAll() async {
    await _payeeRepository.clearAll();
  }

  void populate() async {
    await clearAll();

    var emptyPayee = PayeeModel(
      deleted: false,
    );

    var mePayee = emptyPayee.copyWith.call(name: 'Eu');
    var familyPayee = emptyPayee.copyWith.call(name: 'Familia');
    var friendsPayee = emptyPayee.copyWith.call(name: 'Amigos');

    await _payeeRepository.save(mePayee);
    await _payeeRepository.save(familyPayee);
    await _payeeRepository.save(friendsPayee);
  }
}
