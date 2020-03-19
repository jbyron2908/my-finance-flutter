import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/tag/model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/view/tag/selection/screen/screen.dart';

class TagSelectionRoute extends BaseRoute {
  @override
  String get routePath => "/tag/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<List<TagModel>>(
      builder: (context) => TagSelectionScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
