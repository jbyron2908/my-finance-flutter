import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/controller/operation_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/controller/operation_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_form_view.dart';

class OperationFormScreen extends StatelessWidget {
  static String get _routePath => '/manager/operation/form';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => OperationFormScreen(),
        binding: OperationFormBinding(),
      );

  static void navigateTo(OperationFormArg argument) {
    AppRouter.navigateTo(_routePath, argument);
  }

  @override
  Widget build(BuildContext context) {
    return OperationFormView();
  }
}

class OperationFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OperationFormController());
    OperationFormArg arguments = Get.arguments;
    Get.put(OperationFormViewModel(arguments.model));
  }
}

class OperationFormArg {
  final OperationModel model;

  OperationFormArg(this.model);

  static OperationFormArg create(AccountModel account) {
    var model = OperationModel(account: account);

    return OperationFormArg(model);
  }

  static OperationFormArg copy(OperationModel operation) {
    var model = operation.copyWith(
      id: null,
      date: DateTime.now(),
    );

    return OperationFormArg(model);
  }

  static OperationFormArg edit(OperationModel model) {
    return OperationFormArg(model);
  }
}
