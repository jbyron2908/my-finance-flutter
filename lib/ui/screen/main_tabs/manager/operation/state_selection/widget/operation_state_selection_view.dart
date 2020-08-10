import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_data_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/widget/operation_state_item.dart';

class OperationStateSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select State'),
      ),
      body: _OperationStateList(),
    );
  }
}

class _OperationStateList extends StatelessWidget {
  final AppDataController appDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var operationStateList = appDataController.operationStateList.value;
        return ListView.builder(
          itemCount: operationStateList.length,
          itemBuilder: (context, index) => OperationStateItem(
            operationState: operationStateList[index],
          ),
        );
      },
    );
  }
}
