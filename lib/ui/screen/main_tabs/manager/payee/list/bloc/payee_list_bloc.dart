import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_screen.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class PayeeListBloc extends BaseBloc {
  static PayeeListBloc of(BuildContext context) =>
      Provider.of<PayeeListBloc>(context, listen: false);

  final BuildContext context;
  PayeeRepository _payeeRepository;

  PayeeListBloc({
    @required this.context,
  }) {
    _payeeRepository = PayeeRepository.of(context);
  }

  Future deletePayee(PayeeModel payee) {
    return _payeeRepository.delete(payee);
  }

  void editPayee(PayeeModel payee) {
    PayeeFormRoute(
      argument: PayeeFormScreenArgs.edit(payee: payee),
    ).navigateIntoTab(context);
  }

  @override
  List<SingleChildWidget> get dependencies => [];
}
