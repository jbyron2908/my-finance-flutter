import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/tag_model.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_selection/tag_selection_view.dart';

class TagSelectionRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/tag/selection";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<List<TagModel>>(
      builder: (context) => TagSelectionView(),
      settings: routeSettings,
    );
  }

  static Future<List<TagModel>> navigateTo(BuildContext context) async {
    return await Navigator.pushNamed(
      context,
      _routePath,
    );
  }
}
