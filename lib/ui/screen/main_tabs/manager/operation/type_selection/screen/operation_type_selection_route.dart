import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/screen/operation_type_selection_screen.dart';

class OperationTypeSelectionRoute extends BaseRoute {
  OperationTypeSelectionRouteArgs routeArguments;

  OperationTypeSelectionRoute({this.routeArguments});

  @override
  String get routePath => "/manager/operation/type_selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as OperationTypeSelectionRouteArgs;

    return MaterialPageRoute<OperationTypeModel>(
      builder: (context) => OperationTypeSelectionScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => this.routeArguments;
}

class OperationTypeSelectionRouteArgs {
  int field1;

  OperationTypeSelectionRouteArgs({
    this.field1,
  });
}