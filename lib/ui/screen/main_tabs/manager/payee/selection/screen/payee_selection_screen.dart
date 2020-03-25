import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/bloc/payee_selection_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/widget/payee_selection_view.dart';
import 'package:provider/provider.dart';

class PayeeSelectionScreen
    extends BaseScreen<PayeeSelectionBloc, PayeeSelectionScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return PayeeSelectionView();
  }

  @override
  PayeeSelectionBloc buildBloc(BuildContext context) {
    return PayeeSelectionBloc();
  }
}

class PayeeSelectionScreenArgs {
  static PayeeSelectionScreenArgs of(BuildContext context) =>
      Provider.of<PayeeSelectionScreenArgs>(context, listen: false);

  int field1;

  PayeeSelectionScreenArgs({
    this.field1,
  });
}
