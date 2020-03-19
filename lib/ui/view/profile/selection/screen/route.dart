import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/view/profile/selection/screen/screen.dart';

class ProfileSelectionRoute extends BaseRoute {
  ProfileSelectionRouteArgs routeArguments;

  ProfileSelectionRoute({this.routeArguments});

  @override
  String get routePath => "/profile/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as ProfileSelectionRouteArgs;

    return MaterialPageRoute<ProfileModel>(
      builder: (context) => ProfileSelectionScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => this.routeArguments;
}

class ProfileSelectionRouteArgs {
  int field1;

  ProfileSelectionRouteArgs({
    this.field1,
  });
}
