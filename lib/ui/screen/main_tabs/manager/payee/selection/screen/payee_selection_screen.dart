import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/bloc/payee_selection_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/widget/payee_selection_view.dart';

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
