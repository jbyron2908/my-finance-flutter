import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/account/account_list/account_list_view.dart';

class AccountListRoute extends BaseRoute {
  @override
  String get routePath => "/account/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountListView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
