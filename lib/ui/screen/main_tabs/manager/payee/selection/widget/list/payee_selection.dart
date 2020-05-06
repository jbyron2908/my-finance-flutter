import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/widget/list/payee_selection_item.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_list.dart';
import 'package:provider/provider.dart';

class PayeeSelection extends StatelessWidget {
  PayeeSelection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<PayeeModel>>(
      builder: (_, list, child) => ItemList(
        modelList: list,
        itemBuilder: (context, model) => PayeeSelectionItem(payee: model),
      ),
    );
  }
}
