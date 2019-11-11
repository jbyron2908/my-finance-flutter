import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_list/screen/payee_list_bloc.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_list/widget/payee_list_view.dart';

class PayeeListScreen extends BaseScreen<PayeeListBloc> {
  @override
  Widget build(BuildContext context) {
    return PayeeListView();
  }

  @override
  PayeeListBloc buildBloc(BuildContext context) {
    return PayeeListBloc();
  }
}
