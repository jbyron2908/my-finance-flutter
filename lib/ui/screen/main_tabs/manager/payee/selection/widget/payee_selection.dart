import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/widget/item/payee_item.dart';
import 'package:provider/provider.dart';

class PayeeSelection extends StatelessWidget {
  PayeeSelection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<PayeeModel>>(
      builder: (_, payeeList, child) => ListView.separated(
        itemCount: payeeList.length,
        itemBuilder: (context, index) => PayeeItem(
          payee: payeeList[index],
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
