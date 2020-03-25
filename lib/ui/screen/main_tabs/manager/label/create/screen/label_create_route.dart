import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/create/screen/label_create_screen.dart';

class LabelCreateRoute extends BaseRoute<LabelCreateScreenArgs> {
  LabelCreateRoute({LabelCreateScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/label/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => LabelCreateScreen(),
      settings: routeSettings,
    );
  }
}
