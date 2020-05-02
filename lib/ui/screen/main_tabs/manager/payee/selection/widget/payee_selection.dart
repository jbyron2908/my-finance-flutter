import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/widgets/payee_item.dart';
import 'package:provider/provider.dart';

class PayeeSelection extends StatelessWidget {
  PayeeSelection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<PayeeModel>>(
      builder: (_, payeeList, child) => ListView.builder(
        itemCount: payeeList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => MainTabRouter.of(context).pop(payeeList[index]),
          child: PayeeItem(
            payee: payeeList[index],
          ),
        ),
      ),
    );
  }
}
