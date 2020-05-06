import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/bloc/payee_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/widget/payee_item_view.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_actions.dart';

class PayeeListItem extends StatelessWidget {
  PayeeListItem({
    Key key,
    this.payee,
  }) : super(key: key);

  final PayeeModel payee;

  @override
  Widget build(BuildContext context) {
    return ItemActions(
      onDelete: () => _delete(context),
      onEdit: () => _edit(context),
      child: PayeeItemView(
        payee: payee,
      ),
    );
  }

  void _edit(BuildContext context) {
    final bloc = PayeeListBloc.of(context);
    bloc.editPayee(payee);
  }

  Future _delete(BuildContext context) async {
    var confirmation = await DialogHelper.showAlertDialog(
      context,
      title: 'Delete payee',
      content: 'Do you want to delete this payee?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    if (confirmation == true) {
      final bloc = PayeeListBloc.of(context);
      await bloc.deletePayee(payee);
    }
  }
}
