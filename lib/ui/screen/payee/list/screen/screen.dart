import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/payee/list/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/payee/list/widget/view.dart';

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
