import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_screen.dart';

class OperationFormRoute extends BaseRoute<OperationFormScreenArgs>
    with MainTabRoute {
  OperationFormRoute.forRouter();

  OperationFormRoute({
    @required OperationFormScreenArgs argument,
  }) : super(argument: argument);

  @override
  String get routePath => '/manager/operation/create';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => OperationFormScreen(),
      settings: routeSettings,
    );
  }
}
