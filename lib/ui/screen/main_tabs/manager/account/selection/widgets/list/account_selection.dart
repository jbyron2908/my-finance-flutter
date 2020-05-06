import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/widgets/list/account_selection_item.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_list.dart';
import 'package:provider/provider.dart';

class AccountSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<AccountModel>>(
      builder: (_, list, child) => ItemList(
        modelList: list,
        itemBuilder: (context, model) => AccountSelectionItem(account: model),
      ),
    );
  }
}
