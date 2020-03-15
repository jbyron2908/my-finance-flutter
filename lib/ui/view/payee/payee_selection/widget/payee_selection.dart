import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/payee_model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/view/payee/widgets/payee_item.dart';
import 'package:provider/provider.dart';

class PayeeSelection extends StatelessWidget {
  PayeeSelection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<PayeeModel>>(
      builder: (_, payeeList, child) => ListView.builder(
        itemCount: payeeList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => AppRouter.pop(context, payeeList[index]),
          child: PayeeItem(
            payee: payeeList[index],
          ),
        ),
      ),
    );
  }
}
