import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/widget/payee_list.dart';

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
        onPressed: () => _navigateToPayeeForm(context),
      ),
    );
  }

  void _navigateToPayeeForm(BuildContext context) {
    PayeeFormRoute(
      argument: PayeeFormScreenArgs.create(),
    ).navigateIntoTab(context);
  }
}
