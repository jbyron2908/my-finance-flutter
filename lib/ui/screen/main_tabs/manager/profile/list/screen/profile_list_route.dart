import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/screen/profile_list_screen.dart';

class ProfileListRoute extends BaseRoute {
  ProfileListRouteArgs routeArguments;

  ProfileListRoute({this.routeArguments});

  @override
  String get routePath => "/manager/profile/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as ProfileListRouteArgs;

    return MaterialPageRoute(
      builder: (context) => ProfileListScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => this.routeArguments;
}

class ProfileListRouteArgs {
  int field1;

  ProfileListRouteArgs({
    this.field1,
  });
}
