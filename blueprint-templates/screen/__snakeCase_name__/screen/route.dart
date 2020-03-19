import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';

class {{pascalCase name}}Route extends BaseRoute {
  {{pascalCase name}}RouteArgs routeArguments;

  {{pascalCase name}}Route({this.routeArguments});

  @override
  String get routePath => "/routeName";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as {{pascalCase name}}RouteArgs;

    return MaterialPageRoute(
      builder: (context) => {{pascalCase name}}Screen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => this.routeArguments;
}

class {{pascalCase name}}RouteArgs {
  int field1;

  {{pascalCase name}}RouteArgs({
    this.field1,
  });
}
