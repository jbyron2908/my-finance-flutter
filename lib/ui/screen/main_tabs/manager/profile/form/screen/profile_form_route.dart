import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_screen.dart';

class ProfileFormRoute extends BaseRoute<ProfileFormScreenArgs>
    with MainTabRoute {
  ProfileFormRoute.forRouter();

  ProfileFormRoute({
    @required ProfileFormScreenArgs argument,
  }) : super(argument: argument);

  @override
  String get routePath => "/manager/profile/form";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ProfileFormScreen(),
      settings: routeSettings,
    );
  }
}
