import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/account/selection/screen/account_selection_screen.dart';

class AccountSelectionRoute extends BaseRoute {
  @override
  String get routePath => "/account/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<AccountModel>(
      builder: (context) => AccountSelectionScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
