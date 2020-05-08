import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_screen.dart';

class AccountViewerRoute extends BaseRoute<AccountViewerScreenArgs>
    with MainTabRoute {
  AccountViewerRoute.forRouter();

  AccountViewerRoute({AccountViewerScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/home/account_viewer';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountViewerScreen(),
      settings: routeSettings,
    );
  }
}
