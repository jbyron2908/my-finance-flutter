import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/bloc/payee_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/widget/payee_form_view.dart';
import 'package:provider/provider.dart';

class PayeeFormScreen extends BaseScreen<PayeeFormBloc, PayeeFormScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return PayeeFormView();
  }

  @override
  PayeeFormBloc buildBloc(BuildContext context) {
    var argument = getArgument(context);

    return PayeeFormBloc(
      context,
      payee: argument.payee,
    );
  }
}

class PayeeFormScreenArgs {
  static PayeeFormScreenArgs of(BuildContext context) =>
      Provider.of<PayeeFormScreenArgs>(context, listen: false);

  PayeeModel payee;

  PayeeFormScreenArgs({
    this.payee,
  });

  static PayeeFormScreenArgs create() {
    var payee = PayeeModel();

    return PayeeFormScreenArgs(
      payee: payee,
    );
  }

  static PayeeFormScreenArgs edit({
    PayeeModel payee,
  }) {
    return PayeeFormScreenArgs(
      payee: payee,
    );
  }
}
