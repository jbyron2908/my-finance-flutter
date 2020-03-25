import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/screen/account_selection_screen.dart';

class AccountSelectionRoute extends BaseRoute {
  @override
  String get routePath => "/manager/account/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as AccountSelectionRouteArgs;

    return MaterialPageRoute<AccountModel>(
      builder: (context) => AccountSelectionScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}

class AccountSelectionRouteArgs {
  int field1;

  AccountSelectionRouteArgs({
    this.field1,
  });
}
