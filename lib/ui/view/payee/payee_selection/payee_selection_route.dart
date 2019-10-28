import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/payee_model.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_selection/payee_selection_view.dart';

class PayeeSelectionRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/payee/selection";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<PayeeModel>(
      builder: (context) => PayeeSelectionView(),
      settings: routeSettings,
    );
  }

  static Future<PayeeModel> navigateTo(BuildContext context) async {
    return await Navigator.pushNamed(
      context,
      _routePath,
    );
  }
}
