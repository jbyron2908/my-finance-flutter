import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationHandler {
  NavigationHandler(this.routeList);

  final List<GetPageRoute> routeList;

  Route<dynamic> routeGenerator(RouteSettings settings) {
    var matchRoute = routeList.firstWhere(
      (route) => route.settings.name == settings.name,
      orElse: () => null,
    );

    if (matchRoute != null) {
      return _buildGetPageRoute(matchRoute, settings);
    }

    return null;
  }

  GetPageRoute _buildGetPageRoute(
    GetPageRoute route,
    RouteSettings settings,
  ) {
    return GetPageRoute(
      page: route.page,
      parameter: route.parameter,
      settings: RouteSettings(
        name: settings.name,
        arguments: settings.arguments,
      ),
      curve: route.curve,
      opaque: route.opaque,
      customTransition: route.customTransition,
      binding: route.binding,
      bindings: route.bindings,
      transitionDuration: (route.transitionDuration),
      transition: route.transition,
      popGesture: route.popGesture,
      fullscreenDialog: route.fullscreenDialog,
    );
  }
}
