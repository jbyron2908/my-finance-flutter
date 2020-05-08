import 'package:flutter/material.dart';

abstract class BaseRoute<T> {
  BaseRoute({this.argument});

  final T argument;

  String get routePath;
  MaterialPageRoute generateRoute(RouteSettings routeSettings);

  MapEntry<String, MaterialPageRoute Function(RouteSettings routeSettings)>
      get route => MapEntry(routePath, generateRoute);
}
