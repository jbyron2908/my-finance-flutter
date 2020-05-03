import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/widget/item/payee_actions.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/widget/item/payee_view.dart';
import 'package:provider/provider.dart';

class PayeeItem extends StatelessWidget {
  static PayeeModel payeeOf(BuildContext context) =>
      Provider.of<PayeeModel>(context, listen: false);

  PayeeItem({
    Key key,
    this.payee,
  }) : super(key: key);

  final PayeeModel payee;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: payee,
      child: PayeeActions(
        child: PayeeView(),
      ),
    );
  }
}
