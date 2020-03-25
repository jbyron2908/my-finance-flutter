import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/screen/payee_selection_screen.dart';

class PayeeSelectionRoute extends BaseRoute {
  @override
  String get routePath => "/payee/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<PayeeModel>(
      builder: (context) => PayeeSelectionScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
