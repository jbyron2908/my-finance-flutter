import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/screen/profile_selection_screen.dart';

class ProfileSelectionRoute extends BaseRoute<ProfileSelectionScreenArgs>
    with MainTabRoute {
  ProfileSelectionRoute.forRouter();

  ProfileSelectionRoute({ProfileSelectionScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/profile/selection';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<ProfileModel>(
      builder: (context) => ProfileSelectionScreen(),
      settings: routeSettings,
    );
  }
}
