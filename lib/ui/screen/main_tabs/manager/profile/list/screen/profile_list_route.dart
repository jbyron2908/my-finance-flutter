import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/screen/profile_list_screen.dart';
import 'package:provider/provider.dart';

class ProfileListRoute extends BaseRoute<ProfileListRouteArgs, void>
    with MainTabRoute {
  ProfileListRoute.forRouter();

  ProfileListRoute({ProfileListRouteArgs argument}) : super(argument: argument);

  @override
  String get routePath => '/manager/profile/list';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ProfileListScreen(),
      settings: routeSettings,
    );
  }
}

class ProfileListRouteArgs {
  static ProfileListRouteArgs of(BuildContext context) =>
      Provider.of<ProfileListRouteArgs>(context, listen: false);

  int field1;

  ProfileListRouteArgs({
    this.field1,
  });
}
