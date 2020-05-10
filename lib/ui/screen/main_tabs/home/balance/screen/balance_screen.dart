import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/bloc/balance_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/screen/balance_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/widget/balance_view.dart';

class BalanceScreen extends BaseScreen<BalanceBloc, BalanceRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return BalanceView();
  }

  @override
  BalanceBloc buildBloc(BuildContext context) {
    return BalanceBloc();
  }
}
