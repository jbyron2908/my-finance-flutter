import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/screen/account_selection_screen.dart';
import 'package:provider/provider.dart';

class AccountSelectionRoute
    extends BaseRoute<AccountSelectionRouteArgs, AccountModel>
    with MainTabRoute {
  AccountSelectionRoute.forRouter();

  AccountSelectionRoute({AccountSelectionRouteArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/account/selection';

  @override
  MaterialPageRoute<AccountModel> generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<AccountModel>(
      builder: (context) => AccountSelectionScreen(),
      settings: routeSettings,
    );
  }
}

class AccountSelectionRouteArgs {
  static AccountSelectionRouteArgs of(BuildContext context) =>
      Provider.of<AccountSelectionRouteArgs>(context, listen: false);

  int field1;

  AccountSelectionRouteArgs({
    this.field1,
  });
}
