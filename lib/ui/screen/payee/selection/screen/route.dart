import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/screen/payee/selection/screen/screen.dart';

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
