import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/controller/payee_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/controller/payee_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/widget/payee_form_view.dart';

class PayeeFormScreen extends StatelessWidget {
  static String get _routeName => '/manager/payee/form';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => PayeeFormScreen(),
          binding: PayeeFormBinding(),
        ),
      );

  static void navigateTo(PayeeFormArg argument) {
    MainTabRouter.navigateTo(_routeName, argument);
  }

  @override
  Widget build(BuildContext context) {
    return PayeeFormView();
  }
}

class PayeeFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PayeeFormController());
    PayeeFormArg arguments = Get.arguments;
    Get.put(PayeeFormViewModel(arguments.payee));
  }
}

class PayeeFormArg {
  PayeeModel payee;

  PayeeFormArg({
    this.payee,
  });

  static PayeeFormArg create() {
    var payee = PayeeModel();

    return PayeeFormArg(
      payee: payee,
    );
  }

  static PayeeFormArg edit(
    PayeeModel payee,
  ) {
    return PayeeFormArg(
      payee: payee,
    );
  }
}
