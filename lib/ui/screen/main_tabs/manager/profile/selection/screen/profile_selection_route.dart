import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/screen/profile_selection_screen.dart';
import 'package:provider/provider.dart';

class ProfileSelectionRoute extends BaseRoute<ProfileSelectionRouteArgs, void>
    with MainTabRoute {
  ProfileSelectionRoute.forRouter();

  ProfileSelectionRoute({ProfileSelectionRouteArgs argument})
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

class ProfileSelectionRouteArgs {
  static ProfileSelectionRouteArgs of(BuildContext context) =>
      Provider.of<ProfileSelectionRouteArgs>(context, listen: false);

  int field1;

  ProfileSelectionRouteArgs({
    this.field1,
  });
}
