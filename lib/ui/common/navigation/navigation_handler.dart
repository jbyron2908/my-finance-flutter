import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationHandler {
  NavigationHandler(this.routeList);

  final List<GetPageRoute> routeList;

  Route routeGenerator(RouteSettings settings) {
    var matchRoute = routeList.firstWhere(
      (route) => route.settings.name == settings.name,
      orElse: () => null,
    );

    if (matchRoute != null) {
      return _buildGetPageRoute(matchRoute, settings);
    }

    return null;
  }

  GetPageRoute<T> _buildGetPageRoute<T>(
    GetPageRoute<T> route,
    RouteSettings settings,
  ) {
    return GetPageRoute<T>(
      page: route.page,
      parameter: route.parameter,
      settings: settings,
      curve: route.curve,
      opaque: route.opaque,
      customTransition: route.customTransition,
      binding: route.binding,
      bindings: route.bindings,
      transitionDuration: route.transitionDuration,
      transition: route.transition,
      popGesture: route.popGesture,
      fullscreenDialog: route.fullscreenDialog,
    );
  }
}
