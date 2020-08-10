import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_data_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/widget/operation_type_item.dart';

class OperationTypeSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Type'),
      ),
      body: _OperationTypeList(),
    );
  }
}

class _OperationTypeList extends StatelessWidget {
  final AppDataController appDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var operationTypeList = appDataController.operationTypeList.value;
        return ListView.builder(
          itemCount: operationTypeList.length,
          itemBuilder: (context, index) => OperationTypeItem(
            operationType: operationTypeList[index],
          ),
        );
      },
    );
  }
}
