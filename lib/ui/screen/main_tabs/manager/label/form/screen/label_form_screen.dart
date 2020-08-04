import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/controller/label_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/widget/label_form_view.dart';

class LabelFormScreen extends StatelessWidget {
  static String get _routePath => '/manager/label/form';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => LabelFormScreen(),
        binding: LabelFormBinding(),
      );

  static void navigateTo() {
    AppRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return LabelFormView();
  }
}

class LabelFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LabelFormController());
  }
}
