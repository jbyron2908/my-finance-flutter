import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/payee_model.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_create/payee_create_route.dart';
import 'package:my_finance_flutter/ui/view/payee/widgets/payee_item.dart';
import 'package:provider/provider.dart';

class PayeeListView extends StatelessWidget {
  PayeeListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payees"),
      ),
      body: Container(
        child: _PayeeList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToPayeeCreate(context),
      ),
    );
  }

  void _navigateToPayeeCreate(BuildContext context) {
    PayeeCreateRoute.navigateTo(context);
  }
}

class _PayeeList extends StatelessWidget {
  _PayeeList({Key key}) : super(key: key);

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
