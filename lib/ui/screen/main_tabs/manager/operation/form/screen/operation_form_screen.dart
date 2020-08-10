import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/controller/operation_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/controller/operation_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_form_view.dart';

class OperationFormScreen extends StatelessWidget {
  static String get _routeName => '/manager/operation/form';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => OperationFormScreen(),
          binding: OperationFormBinding(),
        ),
      );

  static void navigateTo(OperationFormArg argument) {
    MainTabRouter.navigateTo(_routeName, argument);
  }

  final OperationFormViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context).settings.arguments;
    viewModel.setArgument(argument);
    return OperationFormView();
  }
}

class OperationFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OperationFormViewModel());
    Get.put(OperationFormController());
  }
}

class OperationFormArg {
  final OperationModel operation;

  OperationFormArg(this.operation);

  static OperationFormArg create(AccountModel account) {
    var model = OperationModel.buildEmpty();
    model = model.copyWith(
      account: account,
    );

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
