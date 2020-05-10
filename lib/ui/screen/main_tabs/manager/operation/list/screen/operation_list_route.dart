import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/screen/operation_list_screen.dart';
import 'package:provider/provider.dart';

class OperationListRoute extends BaseRoute<OperationListRouteArgs, void>
    with MainTabRoute {
  OperationListRoute.forRouter();

  OperationListRoute({OperationListRouteArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/operation/list';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => OperationListScreen(),
      settings: routeSettings,
    );
  }
}

class OperationListRouteArgs {
  static OperationListRouteArgs of(BuildContext context) =>
      Provider.of<OperationListRouteArgs>(context, listen: false);

  int field1;

  OperationListRouteArgs({
    this.field1,
  });
}
