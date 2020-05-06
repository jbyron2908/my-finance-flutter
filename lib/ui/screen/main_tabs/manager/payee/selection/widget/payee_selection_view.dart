import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/widget/payee_selection_item.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/widget/payee_list.dart';

class PayeeSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Payee"),
      ),
      body: Container(
        child: PayeeList(
          itemBuilder: (context, payee) => PayeeSelectionItem(
            payee: payee,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToPayeeForm(context),
      ),
    );
  }

  _navigateToPayeeForm(BuildContext context) {
    PayeeFormRoute(
      argument: PayeeFormScreenArgs.create(),
    ).navigateIntoTab(context);
  }
}
