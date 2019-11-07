import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/tag_model.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_selection/tag_selection_view.dart';

class TagSelectionRoute extends BaseRoute {
  @override
  String get routePath => "/tag/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<List<TagModel>>(
      builder: (context) => TagSelectionView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
