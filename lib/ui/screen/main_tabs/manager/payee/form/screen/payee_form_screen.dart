import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/controller/payee_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/controller/payee_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/widget/payee_form_view.dart';

class PayeeFormScreen extends StatelessWidget {
  static String get _routePath => '/manager/payee/form';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => PayeeFormScreen(),
        binding: PayeeFormBinding(),
      );

  static void navigateTo(PayeeFormArg argument) {
    AppRouter.navigateTo(_routePath, argument);
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
