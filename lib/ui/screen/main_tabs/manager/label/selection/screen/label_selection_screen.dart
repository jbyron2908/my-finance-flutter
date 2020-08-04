import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/controller/label_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/widget/label_selection_view.dart';

class LabelSelectionScreen extends StatelessWidget {
  static String get _routePath => '/manager/label/selection';
  static GetPageRoute get route => GetPageRoute<List<LabelModel>>(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => LabelSelectionScreen(),
        binding: LabelSelectionBinding(),
      );

  static Future<List<LabelModel>> navigateTo() {
    return AppRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return LabelSelectionView();
  }
}

class LabelSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LabelSelectionController());
  }
}

class LabelSelectionArg {
  bool selectParent;

  LabelSelectionArg([this.selectParent = false]);
}
