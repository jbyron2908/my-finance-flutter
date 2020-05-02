import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/screen/label_form_screen.dart';

class LabelFormRoute extends BaseRoute<LabelFormScreenArgs> with MainTabRoute {
  LabelFormRoute.forRouter();

  LabelFormRoute({LabelFormScreenArgs argument}) : super(argument: argument);

  @override
  String get routePath => "/manager/label/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => LabelFormScreen(),
      settings: routeSettings,
    );
  }
}
