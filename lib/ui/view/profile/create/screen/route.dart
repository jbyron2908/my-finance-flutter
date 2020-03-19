import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/view/profile/create/screen/screen.dart';

class ProfileCreateRoute extends BaseRoute {
  ProfileCreateRouteArgs routeArguments;

  ProfileCreateRoute({this.routeArguments});

  @override
  String get routePath => "/profile/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as ProfileCreateRouteArgs;

    return MaterialPageRoute(
      builder: (context) => ProfileCreateScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => this.routeArguments;
}

class ProfileCreateRouteArgs {
  int field1;

  ProfileCreateRouteArgs({
    this.field1,
  });
}
