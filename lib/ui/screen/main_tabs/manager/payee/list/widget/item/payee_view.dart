import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/widget/item/payee_item.dart';

class PayeeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var payee = PayeeItem.payeeOf(context);

    return ListTile(
      title: Text(
        payee.name,
      ),
    );
  }
}
