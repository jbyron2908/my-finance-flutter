import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/screen/label_selection_screen.dart';
import 'package:provider/provider.dart';

class LabelSelectionRoute
    extends BaseRoute<LabelSelectionRouteArgs, List<LabelModel>>
    with MainTabRoute {
  LabelSelectionRoute.forRouter();

  LabelSelectionRoute({LabelSelectionRouteArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/label/selection';

  @override
  MaterialPageRoute<List<LabelModel>> generateRoute(
      RouteSettings routeSettings) {
    return MaterialPageRoute<List<LabelModel>>(
      builder: (context) => LabelSelectionScreen(),
      settings: routeSettings,
    );
  }
}

class LabelSelectionRouteArgs {
  static LabelSelectionRouteArgs of(BuildContext context) =>
      Provider.of<LabelSelectionRouteArgs>(context, listen: false);

  int field1;

  LabelSelectionRouteArgs({
    this.field1,
  });
}
