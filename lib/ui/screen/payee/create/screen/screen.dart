import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/payee/create/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/payee/create/widget/view.dart';

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
