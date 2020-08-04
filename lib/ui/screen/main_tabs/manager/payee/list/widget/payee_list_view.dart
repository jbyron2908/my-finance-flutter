import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/widget/payee_list_item.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/widget/payee_list.dart';

class PayeeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payees'),
      ),
      body: Container(
        child: PayeeList(
          itemBuilder: (context, payee) => PayeeListItem(payee),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToPayeeForm(),
      ),
    );
  }

  void _navigateToPayeeForm() {
    PayeeFormScreen.navigateTo(PayeeFormArg.create());
  }
}
