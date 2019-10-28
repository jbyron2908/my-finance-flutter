import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/account_selection_view.dart';

class AccountSelectionRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/account/selection";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<AccountModel>(
      builder: (context) => AccountSelectionView(),
      settings: routeSettings,
    );
  }

  static Future<AccountModel> navigateTo(BuildContext context) async {
    return await Navigator.pushNamed(
      context,
      _routePath,
    );
  }
}
