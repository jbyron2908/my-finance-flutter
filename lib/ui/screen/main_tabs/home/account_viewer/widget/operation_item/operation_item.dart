import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/controller/account_viewer_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_actions_2.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_view_2.dart';

class OperationItem extends StatelessWidget {
  OperationItem(
    this.index, {
    Key key,
  }) : super(key: key);

  final int index;
  final AccountViewerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return OperationActionsNew(
      index,
      child: OperationViewNew(index),
    );
  }
}
