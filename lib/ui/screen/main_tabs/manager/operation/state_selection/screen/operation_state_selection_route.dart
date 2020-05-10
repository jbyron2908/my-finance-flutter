import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/screen/operation_state_selection_screen.dart';
import 'package:provider/provider.dart';

class OperationStateSelectionRoute
    extends BaseRoute<OperationStateSelectionRouteArgs, OperationStateModel>
    with MainTabRoute {
  OperationStateSelectionRoute.forRouter();

  OperationStateSelectionRoute({OperationStateSelectionRouteArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/operation/state_selection';

  @override
  MaterialPageRoute<OperationStateModel> generateRoute(
      RouteSettings routeSettings) {
    return MaterialPageRoute<OperationStateModel>(
      builder: (context) => OperationStateSelectionScreen(),
      settings: routeSettings,
    );
  }
}

class OperationStateSelectionRouteArgs {
  static OperationStateSelectionRouteArgs of(BuildContext context) =>
      Provider.of<OperationStateSelectionRouteArgs>(context, listen: false);

  int field1;

  OperationStateSelectionRouteArgs({
    this.field1,
  });
}
