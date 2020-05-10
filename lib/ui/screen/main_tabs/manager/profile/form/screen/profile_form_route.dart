import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_screen.dart';
import 'package:provider/provider.dart';

class ProfileFormRoute extends BaseRoute<ProfileFormRouteArgs, void>
    with MainTabRoute {
  ProfileFormRoute.forRouter();

  ProfileFormRoute({
    @required ProfileFormRouteArgs argument,
  }) : super(argument: argument);

  @override
  String get routePath => '/manager/profile/form';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ProfileFormScreen(),
      settings: routeSettings,
    );
  }
}

class ProfileFormRouteArgs {
  static ProfileFormRouteArgs of(BuildContext context) =>
      Provider.of<ProfileFormRouteArgs>(context, listen: false);

  ProfileModel profile;

  ProfileFormRouteArgs({
    this.profile,
  });

  static ProfileFormRouteArgs create() {
    var profile = ProfileModel();

    return ProfileFormRouteArgs(
      profile: profile,
    );
  }

  static ProfileFormRouteArgs edit({
    ProfileModel profile,
  }) {
    return ProfileFormRouteArgs(
      profile: profile,
    );
  }
}
