import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/payee/create/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/payee/list/widget/list.dart';

class PayeeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payees"),
      ),
      body: Container(
        child: PayeeList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToPayeeCreate(context),
      ),
    );
  }

  void _navigateToPayeeCreate(BuildContext context) {
    AppRouter.navigateTo(context, PayeeCreateRoute());
  }
}