import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/account_populate_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/category_populate_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/payee_populate_controller.dart';

class DemoPopulateController extends GetxController {
  final CategoryPopulateController _categoryPopulateController = Get.find();
  final PayeePopulateController _payeePopulateController = Get.find();
  final AccountPopulateController _accountPopulateController = Get.find();

  void onPopulateTap() async {
    await _categoryPopulateController.populate();
    await _payeePopulateController.populate();
    await _accountPopulateController.populate();
  }
}
