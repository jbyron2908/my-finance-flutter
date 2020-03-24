import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/screen/label/selection/screen/screen.dart';

class LabelSelectionRoute extends BaseRoute {
  @override
  String get routePath => "/label/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<List<LabelModel>>(
      builder: (context) => LabelSelectionScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
