import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_actions.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_view.dart';

class OperationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OperationActions(
      child: OperationView(),
    );
  }
}
