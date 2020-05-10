import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_screen.dart';
import 'package:provider/provider.dart';

class AccountViewerRoute extends BaseRoute<AccountViewerRouteArgs, void>
    with MainTabRoute {
  AccountViewerRoute.forRouter();

  AccountViewerRoute({AccountViewerRouteArgs argument})
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

class AccountViewerRouteArgs {
  static AccountViewerRouteArgs of(BuildContext context) =>
      Provider.of<AccountViewerRouteArgs>(context, listen: false);

  final AccountModel account;

  AccountViewerRouteArgs(
    this.account,
  );
}
