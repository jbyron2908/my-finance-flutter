import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:provider/src/provider.dart';

class OperationFormViewModel extends ChangeNotifier {
  static OperationFormViewModel of(BuildContext context) =>
      Provider.of<OperationFormViewModel>(context);

  OperationFormViewModel(OperationModel operation) {
    this.operation = operation;
  }

  OperationModel _operation;

  OperationModel get operation => _operation;

  set operation(OperationModel operation) {
    _operation = operation;
    notifyListeners();
  }

  void update({
    String title,
    double value,
    OperationTypeModel type,
    DateTime date,
    OperationStateModel state,
    String description,
    PayeeModel payee,
    CategoryModel category,
    AccountModel account,
    ProfileModel profile,
  }) {
    operation = operation.copyWith(
      title: title,
      value: value,
      type: type,
      date: date,
      state: state,
      description: description,
      payee: payee,
      category: category,
      account: account,
      profile: profile,
    );
  }
}
