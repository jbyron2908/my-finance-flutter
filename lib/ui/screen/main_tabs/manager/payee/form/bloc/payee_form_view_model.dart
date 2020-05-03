import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:provider/src/provider.dart';

class PayeeFormViewModel extends ChangeNotifier {
  static PayeeFormViewModel of(BuildContext context) =>
      Provider.of<PayeeFormViewModel>(context);

  PayeeFormViewModel(PayeeModel payee) {
    this.payee = payee;
  }

  PayeeModel _payee;

  PayeeModel get payee => _payee;

  set payee(PayeeModel payee) {
    _payee = payee;
    notifyListeners();
  }

  void update({
    String name,
  }) {
    payee = payee.copyWith(
      name: name,
    );
  }
}
