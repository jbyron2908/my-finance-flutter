import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/screen/account_selection_screen.dart';

class AccountSelectionRoute extends BaseRoute<AccountSelectionScreenArgs>
    with MainTabRoute {
  AccountSelectionRoute.forRouter();

  AccountSelectionRoute({AccountSelectionScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/account/selection';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<AccountModel>(
      builder: (context) => AccountSelectionScreen(),
      settings: routeSettings,
    );
  }
}
