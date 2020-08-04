import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/controller/operation_state_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/widget/operation_state_selection_view.dart';

class OperationStateSelectionScreen extends StatelessWidget {
  static String get _routePath => '/manager/operation/state_selection';
  static GetPageRoute get route => GetPageRoute<OperationStateModel>(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => OperationStateSelectionScreen(),
        binding: OperationStateSelectionBinding(),
      );

  static Future<OperationStateModel> navigateTo() {
    return AppRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return OperationStateSelectionView();
  }
}

class OperationStateSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OperationStateSelectionController());
  }
}
