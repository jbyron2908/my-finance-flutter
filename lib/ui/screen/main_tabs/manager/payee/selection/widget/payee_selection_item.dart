import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/widget/payee_item_view.dart';

class PayeeSelectionItem extends StatelessWidget {
  PayeeSelectionItem({
    Key key,
    this.payee,
  }) : super(key: key);

  final PayeeModel payee;

  @override
  Widget build(BuildContext context) {
    return PayeeItemView(
      payee: payee,
      onTap: () => MainTabRouter.of(context).pop(payee),
    );
  }
}
