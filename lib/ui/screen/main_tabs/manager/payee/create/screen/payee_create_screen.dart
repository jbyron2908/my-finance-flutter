import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/create/bloc/payee_create_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/create/widget/payee_create_view.dart';

class PayeeCreateScreen extends BaseScreen<PayeeCreateBloc> {
  @override
  Widget build(BuildContext context) {
    return PayeeCreateView();
  }

  @override
  PayeeCreateBloc buildBloc(BuildContext context) {
    return PayeeCreateBloc();
  }
}
