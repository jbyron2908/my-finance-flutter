import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/bloc/account_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/widget/item/account_item.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.15,
        actions: <Widget>[
          SlideAction(
            child: AccountActionLeft(),
          ),
        ],
        secondaryActions: <Widget>[
          SlideAction(
            child: AccountActionRight(),
          ),
        ],
        child: child,
      ),
    );
  }
}

class AccountActionRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Color(0xffE4A854),
        child: Icon(
          Icons.edit,
          color: Colors.white70,
        ),
        onPressed: () {
          Slidable.of(context).close();
          _edit(context);
        },
      ),
    );
  }

  _edit(BuildContext context) {
    final account = AccountItem.accountOf(context);
    final bloc = AccountListBloc.of(context);
    bloc.editAccount(account);
  }
}

class AccountActionLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white70,
        ),
        onPressed: () async {
          await _delete(context);
          Slidable.of(context).close();
        },
      ),
    );
  }

  Future _delete(BuildContext context) async {
    var confirmation = await DialogHelper.showAlertDialog(
      context,
      title: "Delete account",
      content: "Do you want to delete this account?",
      confirmText: "Yes",
      cancelText: "No",
    );

    if (confirmation == true) {
      final account = AccountItem.accountOf(context);
      final bloc = AccountListBloc.of(context);
      await bloc.deleteAccount(account);
    }
  }
}
