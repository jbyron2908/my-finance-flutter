import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';

abstract class BaseRouter {
  BaseRouter() {
    _routeMap = Map.fromEntries(
      routeList.map(
        (route) => route.route,
      ),
    );
  }

  List<BaseRoute> get routeList;

  Map<String, MaterialPageRoute Function(RouteSettings routeSettings)>
      _routeMap;

  Route generateRoutes(RouteSettings routeSettings) {
    var routeGenerator = _routeMap[routeSettings.name];

    if (routeGenerator != null) {
      return routeGenerator(routeSettings);
    } else {
      return null;
    }
  }
}
