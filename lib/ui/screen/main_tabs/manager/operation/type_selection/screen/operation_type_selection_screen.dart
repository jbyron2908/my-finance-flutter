import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/controller/operation_type_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/widget/operation_type_selection_view.dart';

class OperationTypeSelectionScreen extends StatelessWidget {
  static String get _routePath => '/manager/operation/type_selection';
  static GetPageRoute get route => GetPageRoute<OperationStateModel>(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => OperationTypeSelectionScreen(),
        binding: OperationTypeSelectionBinding(),
      );

  static Future<OperationTypeModel> navigateTo() {
    return AppRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return OperationTypeSelectionView();
  }
}

class OperationTypeSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OperationTypeSelectionController());
  }
}
