import 'package:flutter/material.dart';
import 'package:my_finance_flutter/navigation/route_manager.dart';

abstract class RouteManager {
  static RouteManager _instance;
  static RouteManager get instance {
    if (_instance == null) {
      _instance = MyFinanceRouteManager();
    }
    return _instance;
  }

  Route configureRoutes(RouteSettings routeSettings);
  void navigateToHome(BuildContext context);
}
