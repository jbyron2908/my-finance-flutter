import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/screen/account_create_route.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/widgets/account_selection.dart';

class AccountSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select accounts"),
      ),
      body: Container(
        child: AccountSelection(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToAccountCreate(context),
      ),
    );
  }

  void _navigateToAccountCreate(BuildContext context) {
    AppRouter.navigateTo(context, AccountCreateRoute());
  }
}
