import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_selection/screen/payee_selection_bloc.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_selection/widget/payee_selection_view.dart';

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
