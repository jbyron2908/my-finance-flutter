import 'package:flutter/material.dart';

class NavigationHandler {
  NavigationHandler(this.routeList);

  final List<RouteDefinition> routeList;

  Route routeGenerator(RouteSettings settings) {
    var matchRouteDefinition = routeList.firstWhere(
      (routeDefinition) => routeDefinition.name == settings.name,
      orElse: () => null,
    );

    if (matchRouteDefinition != null) {
      return matchRouteDefinition.routeBuilder(settings);
    }

    return null;
  }
}

class RouteDefinition {
  final String name;
  final Route Function(RouteSettings settings) routeBuilder;

  RouteDefinition({
    @required this.name,
    @required this.routeBuilder,
  });
}
