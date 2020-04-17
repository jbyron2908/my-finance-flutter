import 'package:flutter/material.dart';

abstract class BaseRouter {
  Map<String, MaterialPageRoute Function(RouteSettings routeSettings)>
      get routeMap;

  Route generateRoutes(RouteSettings routeSettings) {
    MaterialPageRoute Function(RouteSettings routeSettings) routeGenerator =
        routeMap[routeSettings.name];

    if (routeGenerator != null) {
      return routeGenerator(routeSettings);
    } else {
      return null;
    }
  }
}
