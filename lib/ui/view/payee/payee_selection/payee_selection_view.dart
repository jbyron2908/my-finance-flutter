import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/payee_model.dart';
import 'package:my_finance_flutter/ui/view/payee/widgets/payee_item.dart';
import 'package:provider/provider.dart';

class PayeeSelectionView extends StatelessWidget {
  PayeeSelectionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Payee"),
      ),
      body: Container(
        child: _PayeeList(),
      ),
    );
  }
}

class _PayeeList extends StatelessWidget {
  _PayeeList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<PayeeModel>>(
      builder: (_, payeeList, child) => ListView.builder(
        itemCount: payeeList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.pop(context, payeeList[index]),
          child: PayeeItem(
            payee: payeeList[index],
          ),
        ),
      ),
    );
  }
}
