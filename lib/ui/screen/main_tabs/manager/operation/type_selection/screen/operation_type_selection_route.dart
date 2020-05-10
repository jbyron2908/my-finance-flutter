import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/screen/operation_type_selection_screen.dart';
import 'package:provider/provider.dart';

class OperationTypeSelectionRoute
    extends BaseRoute<OperationTypeSelectionRouteArgs, void> with MainTabRoute {
  OperationTypeSelectionRoute.forRouter();

  OperationTypeSelectionRoute({OperationTypeSelectionRouteArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/operation/type_selection';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<OperationTypeModel>(
      builder: (context) => OperationTypeSelectionScreen(),
      settings: routeSettings,
    );
  }
}

class OperationTypeSelectionRouteArgs {
  static OperationTypeSelectionRouteArgs of(BuildContext context) =>
      Provider.of<OperationTypeSelectionRouteArgs>(context, listen: false);

  int field1;

  OperationTypeSelectionRouteArgs({
    this.field1,
  });
}
