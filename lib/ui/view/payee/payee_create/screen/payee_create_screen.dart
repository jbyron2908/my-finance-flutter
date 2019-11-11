import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_create/screen/payee_create_bloc.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_create/widget/payee_create_view.dart';

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
