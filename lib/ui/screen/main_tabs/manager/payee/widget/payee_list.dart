import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_list.dart';
import 'package:provider/provider.dart';

class PayeeList extends StatelessWidget {
  const PayeeList({
    Key key,
    @required this.itemBuilder,
  }) : super(key: key);

  final Widget Function(BuildContext, PayeeModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Consumer<List<PayeeModel>>(
      builder: (_, list, child) => ItemList(
        modelList: list,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
