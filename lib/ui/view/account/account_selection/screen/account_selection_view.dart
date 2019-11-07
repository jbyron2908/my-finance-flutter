import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/screen/account_create_route.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/screen/account_selection_bloc.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/widgets/account_selection.dart';

class AccountSelectionView extends BaseScreen<AccountSelectionBloc> {
  AccountSelectionView({Key key}) : super(key: key);

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

  @override
  AccountSelectionBloc buildBloc(BuildContext context) {
    return AccountSelectionBloc(
      accountRepository: AccountRepository.of(context),
    );
  }
}
