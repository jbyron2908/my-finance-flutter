import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/screen/operation_state_selection_screen.dart';

class OperationStateSelectionRoute
    extends BaseRoute<OperationStateSelectionScreenArgs> with MainTabRoute {
  OperationStateSelectionRoute.forRouter();

  OperationStateSelectionRoute({OperationStateSelectionScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/operation/state_selection';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<OperationStateModel>(
      builder: (context) => OperationStateSelectionScreen(),
      settings: routeSettings,
    );
  }
}
