import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/bloc/payee_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/widget/payee_list_view.dart';
import 'package:provider/provider.dart';

class PayeeListScreen extends BaseScreen<PayeeListBloc, PayeeListScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return PayeeListView();
  }

  @override
  PayeeListBloc buildBloc(BuildContext context) {
    return PayeeListBloc(
      context: context,
    );
  }
}

class PayeeListScreenArgs {
  static PayeeListScreenArgs of(BuildContext context) =>
      Provider.of<PayeeListScreenArgs>(context, listen: false);

  int field1;

  PayeeListScreenArgs({
    this.field1,
  });
}
