import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/screen/profile_list_screen.dart';

class ProfileListRoute extends BaseRoute<ProfileListScreenArgs> {
  ProfileListRoute({ProfileListScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/profile/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ProfileListScreen(),
      settings: routeSettings,
    );
  }
}
