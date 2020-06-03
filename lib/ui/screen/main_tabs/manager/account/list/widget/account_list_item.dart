import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/bloc/account_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/widget/account_item_view.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_actions.dart';

class AccountListItem extends StatelessWidget {
  AccountListItem({
    Key key,
    this.account,
  }) : super(key: key);

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: ItemActions(
        onDelete: () => _delete(context),
        onEdit: () => _edit(context),
        child: AccountItemView(
          account: account,
        ),
      ),
    );
  }

  void _edit(BuildContext context) {
    final bloc = AccountListBloc.of(context);
    bloc.editAccount(account);
  }

  Future _delete(BuildContext context) async {
    var confirmation = await DialogHelper.showAlertDialog(
      context,
      title: 'Delete account',
      content: 'Do you want to delete this account?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    if (confirmation == true) {
      final bloc = AccountListBloc.of(context);
      await bloc.deleteAccount(account);
    }
  }
}
