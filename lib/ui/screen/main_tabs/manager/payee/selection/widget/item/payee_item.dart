import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';

class PayeeItem extends StatelessWidget {
  PayeeItem({Key key, this.payee}) : super(key: key);

  final PayeeModel payee;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        payee.name,
      ),
      onTap: () => MainTabRouter.of(context).pop(payee),
    );
  }
}
