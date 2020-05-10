import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_screen.dart';
import 'package:provider/provider.dart';

class AccountFormRoute extends BaseRoute<AccountFormRouteArgs, void>
    with MainTabRoute {
  AccountFormRoute.forRouter();

  AccountFormRoute({
    @required AccountFormRouteArgs argument,
  }) : super(argument: argument);

  @override
  String get routePath => '/manager/account/create';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountFormScreen(),
      settings: routeSettings,
    );
  }
}

class AccountFormRouteArgs {
  static AccountFormRouteArgs of(BuildContext context) =>
      Provider.of<AccountFormRouteArgs>(context, listen: false);

  AccountModel account;

  AccountFormRouteArgs({
    this.account,
  });

  static AccountFormRouteArgs create() {
    var account = AccountModel();

    return AccountFormRouteArgs(
      account: account,
    );
  }

  static AccountFormRouteArgs edit({
    AccountModel account,
  }) {
    return AccountFormRouteArgs(
      account: account,
    );
  }
}
