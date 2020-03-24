import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/payee/selection/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/payee/selection/widget/view.dart';

class PayeeSelectionScreen extends BaseScreen<PayeeSelectionBloc> {
  @override
  Widget build(BuildContext context) {
    return PayeeSelectionView();
  }

  @override
  PayeeSelectionBloc buildBloc(BuildContext context) {
    return PayeeSelectionBloc();
  }
}
