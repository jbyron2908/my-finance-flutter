import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/entity/account_populate_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/entity/category_populate_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/entity/payee_populate_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/operation/operation_populate_controller.dart';

class DemoPopulateController extends GetxController {
  final CategoryPopulateController _categoryPopulateController = Get.find();
  final PayeePopulateController _payeePopulateController = Get.find();
  final AccountPopulateController _accountPopulateController = Get.find();

  final OperationPopulateController _operationPopulateController = Get.find();

  void onClearEntitiesTap() async {
    await _categoryPopulateController.clearAll();
    await _payeePopulateController.clearAll();
    await _accountPopulateController.clearAll();
  }

  void onPopulateEntitiesTap() async {
    await _categoryPopulateController.populate();
    await _payeePopulateController.populate();
    await _accountPopulateController.populate();
  }

  void onClearOperationsTap() async {
    await _operationPopulateController.clearAll();
  }

  void onPopulateAccountsTap() async {
    await _operationPopulateController.populate();
  }
}
