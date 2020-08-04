import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/controller/payee_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/widget/payee_item_view.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_actions.dart';

class PayeeListItem extends StatelessWidget {
  PayeeListItem(
    this.payee, {
    Key key,
  }) : super(key: key);

  final PayeeModel payee;

  final PayeeListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: ItemActions(
        onDelete: () => _delete(),
        onEdit: () => _edit(),
        child: PayeeItemView(
          payee: payee,
        ),
      ),
    );
  }

  void _edit() {
    controller.editPayee(payee);
  }

  Future _delete() async {
    var confirmation = await DialogHelper.showAlertDialog(
      Get.context,
      title: 'Delete payee',
      content: 'Do you want to delete this payee?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    if (confirmation == true) {
      await controller.deletePayee(payee);
    }
  }
}
