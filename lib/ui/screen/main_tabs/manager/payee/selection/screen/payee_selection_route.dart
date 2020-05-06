import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/screen/payee_selection_screen.dart';

class PayeeSelectionRoute extends BaseRoute<PayeeSelectionScreenArgs>
    with MainTabRoute {
  PayeeSelectionRoute.forRouter();

  PayeeSelectionRoute({PayeeSelectionScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/payee/selection';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<PayeeModel>(
      builder: (context) => PayeeSelectionScreen(),
      settings: routeSettings,
    );
  }
}
