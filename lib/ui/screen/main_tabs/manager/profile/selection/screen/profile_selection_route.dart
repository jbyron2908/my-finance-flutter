import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/screen/profile_selection_screen.dart';

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
