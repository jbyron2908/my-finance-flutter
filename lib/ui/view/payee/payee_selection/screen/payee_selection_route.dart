import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_selection/screen/payee_selection_screen.dart';

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
