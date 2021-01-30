import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/app/app_data_controller.dart';
import 'package:my_finance_flutter/ui/widgets/list/item_list.dart';

class PayeeList extends StatelessWidget {
  PayeeList({
    Key key,
    @required this.itemBuilder,
  }) : super(key: key);

  final Widget Function(BuildContext, PayeeModel) itemBuilder;

  final AppDataController appDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var payeeList = appDataController.payeeList.value;
        return ItemList(
          modelList: payeeList,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
