import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/payee_model.dart';
import 'package:my_finance_flutter/ui/view/payee/widgets/payee_item.dart';
import 'package:provider/provider.dart';

class PayeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<PayeeModel>>(
      builder: (_, payeeList, child) => ListView.builder(
        itemCount: payeeList.length,
        itemBuilder: (context, index) => PayeeItem(
          payee: payeeList[index],
        ),
      ),
    );
  }
}
