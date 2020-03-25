import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/create/screen/profile_create_screen.dart';

class ProfileCreateRoute extends BaseRoute<ProfileCreateScreenArgs> {
  ProfileCreateRoute({ProfileCreateScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/profile/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ProfileCreateScreen(),
      settings: routeSettings,
    );
  }
}
