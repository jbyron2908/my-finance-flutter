import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/controller/payee_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/widget/payee_selection_view.dart';

class PayeeSelectionScreen extends StatelessWidget {
  static String get _routePath => '/manager/payee/selection';
  static GetPageRoute get route => GetPageRoute<PayeeModel>(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => PayeeSelectionScreen(),
        binding: PayeeSelectionBinding(),
      );

  static Future<PayeeModel> navigateTo() {
    return AppRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return PayeeSelectionView();
  }
}

class PayeeSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PayeeSelectionController());
  }
}
