import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/controller/account_viewer_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_item.dart';

class OperationList extends StatelessWidget {
  final AccountViewerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          var operationList = controller.operationList.value;
          if (operationList == null) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: operationList.length,
              itemBuilder: (context, index) => OperationItem(index),
            );
          }
        },
      ),
    );
  }
}
