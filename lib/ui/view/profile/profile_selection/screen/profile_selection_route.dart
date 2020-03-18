import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_selection/screen/profile_selection_screen.dart';

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
