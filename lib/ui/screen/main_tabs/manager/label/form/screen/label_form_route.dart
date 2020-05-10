import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/screen/label_form_screen.dart';
import 'package:provider/provider.dart';

class LabelFormRoute extends BaseRoute<LabelFormRouteArgs, void>
    with MainTabRoute {
  LabelFormRoute.forRouter();

  LabelFormRoute({LabelFormRouteArgs argument}) : super(argument: argument);

  @override
  String get routePath => '/manager/label/create';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => LabelFormScreen(),
      settings: routeSettings,
    );
  }
}

class LabelFormRouteArgs {
  static LabelFormRouteArgs of(BuildContext context) =>
      Provider.of<LabelFormRouteArgs>(context, listen: false);

  int field1;

  LabelFormRouteArgs({
    this.field1,
  });
}
