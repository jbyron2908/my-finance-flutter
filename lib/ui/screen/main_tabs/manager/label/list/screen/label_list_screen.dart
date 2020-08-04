import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/controller/label_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/widget/label_list_view.dart';

class LabelListScreen extends StatelessWidget {
  static String get _routePath => '/manager/label/list';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => LabelListScreen(),
        binding: LabelListBinding(),
      );

  static void navigateTo() {
    AppRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return LabelListView();
  }
}

class LabelListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LabelListController());
  }
}
