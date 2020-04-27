import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_actions.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_view.dart';
import 'package:provider/provider.dart';

class OperationItem extends StatelessWidget {
  static OperationModel operationOf(BuildContext context) =>
      Provider.of<OperationModel>(context, listen: false);

  const OperationItem({
    Key key,
    @required this.operation,
  }) : super(key: key);

  final OperationModel operation;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: operation,
      child: OperationActions(
        child: OperationView(),
      ),
    );
  }
}
