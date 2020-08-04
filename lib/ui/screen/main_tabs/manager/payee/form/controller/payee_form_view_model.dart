import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:provider/src/provider.dart';

class PayeeFormViewModel extends GetxController {
  static PayeeFormViewModel of(BuildContext context) =>
      Provider.of<PayeeFormViewModel>(context);

  PayeeFormViewModel(PayeeModel payee) {
    this.payee = payee;
  }

  PayeeModel _payee;

  PayeeModel get payee => _payee;

  set payee(PayeeModel payee) {
    _payee = payee;
  }

  void updatePayee({
    String name,
  }) {
    payee = payee.copyWith(
      name: name,
    );
  }
}
