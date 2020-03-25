import 'package:flutter/material.dart';

abstract class BaseRoute {
  String get routePath;

  MaterialPageRoute generateRoute(RouteSettings routeSettings);

  Object get arguments;

  MapEntry<String, MaterialPageRoute Function(RouteSettings routeSettings)>
      get route => MapEntry(routePath, generateRoute);
}
