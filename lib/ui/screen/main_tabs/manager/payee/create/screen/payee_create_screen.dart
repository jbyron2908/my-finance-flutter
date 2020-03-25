import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/create/bloc/payee_create_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/create/widget/payee_create_view.dart';
import 'package:provider/provider.dart';

class PayeeCreateScreen
    extends BaseScreen<PayeeCreateBloc, PayeeCreateScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return PayeeCreateView();
  }

  @override
  PayeeCreateBloc buildBloc(BuildContext context) {
    return PayeeCreateBloc();
  }
}

class PayeeCreateScreenArgs {
  static PayeeCreateScreenArgs of(BuildContext context) =>
      Provider.of<PayeeCreateScreenArgs>(context, listen: false);

  int field1;

  PayeeCreateScreenArgs({
    this.field1,
  });
}
