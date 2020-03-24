import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/payee/create/screen/payee_create_route.dart';
import 'package:my_finance_flutter/ui/screen/payee/selection/widget/payee_selection.dart';

class PayeeSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Payee"),
      ),
      body: Container(
        child: PayeeSelection(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToPayeeCreate(context),
      ),
    );
  }

  _navigateToPayeeCreate(BuildContext context) {
    AppRouter.navigateTo(context, PayeeCreateRoute());
  }
}
