import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/screen/operation_type_selection_screen.dart';

class OperationTypeSelectionRoute
    extends BaseRoute<OperationTypeSelectionScreenArgs> with MainTabRoute {
  OperationTypeSelectionRoute.forRouter();

  OperationTypeSelectionRoute({OperationTypeSelectionScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/operation/type_selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<OperationTypeModel>(
      builder: (context) => OperationTypeSelectionScreen(),
      settings: routeSettings,
    );
  }
}
