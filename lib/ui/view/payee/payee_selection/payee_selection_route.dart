import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/payee_model.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_selection/payee_selection_view.dart';

class PayeeSelectionRoute extends BaseRoute {
  @override
  String get routePath => "/payee/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<PayeeModel>(
      builder: (context) => PayeeSelectionView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
