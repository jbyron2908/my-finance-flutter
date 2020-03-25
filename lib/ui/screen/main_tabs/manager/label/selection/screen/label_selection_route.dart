import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/screen/label_selection_screen.dart';

class LabelSelectionRoute extends BaseRoute<LabelSelectionScreenArgs> {
  LabelSelectionRoute({LabelSelectionScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/label/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<List<LabelModel>>(
      builder: (context) => LabelSelectionScreen(),
      settings: routeSettings,
    );
  }
}
