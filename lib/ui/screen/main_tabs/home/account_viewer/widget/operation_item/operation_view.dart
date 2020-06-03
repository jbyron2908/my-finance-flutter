import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_item.dart';

class OperationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final operation = OperationItem.operationOf(context);

    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            operation.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Divider(
            color: Colors.grey,
          ),
          OperationRow(
            rightText: operation.getCategoryWithParent(),
            leftText: DateFormat('dd/MM/yyyy HH:mm').format(operation.date),
          ),
          Divider(
            color: Colors.grey,
          ),
          OperationRow(
            rightText: operation.getPayeeWithStatus(),
            leftText: operation.getValueWithCurrency(),
          ),
          Divider(
            color: Colors.grey,
          ),
          Text(
            'Total: R\$ 0,00',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}

class OperationRow extends StatelessWidget {
  const OperationRow({
    Key key,
    @required this.rightText,
    @required this.leftText,
  }) : super(key: key);

  final String rightText;
  final String leftText;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              rightText,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
          ),
          Expanded(
            flex: 2,
            child: Text(
              leftText,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
