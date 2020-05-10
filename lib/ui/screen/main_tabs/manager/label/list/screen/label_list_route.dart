import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/screen/label_list_screen.dart';
import 'package:provider/provider.dart';

class LabelListRoute extends BaseRoute<LabelListRouteArgs, void>
    with MainTabRoute {
  LabelListRoute.forRouter();

  LabelListRoute({LabelListRouteArgs argument}) : super(argument: argument);

  @override
  String get routePath => '/manager/label/list';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => LabelListScreen(),
      settings: routeSettings,
    );
  }
}

class LabelListRouteArgs {
  static LabelListRouteArgs of(BuildContext context) =>
      Provider.of<LabelListRouteArgs>(context, listen: false);

  int field1;

  LabelListRouteArgs({
    this.field1,
  });
}
