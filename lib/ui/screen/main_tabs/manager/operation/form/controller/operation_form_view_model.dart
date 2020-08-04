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
      title: title ?? operation.title,
      value: value ?? operation.value,
      type: type ?? operation.type,
      date: date ?? operation.date,
      state: state ?? operation.state,
      description: description ?? operation.description,
      payee: payee ?? operation.payee,
      category: category ?? operation.category,
      account: account ?? operation.account,
      profile: profile ?? operation.profile,
    );
  }
}
