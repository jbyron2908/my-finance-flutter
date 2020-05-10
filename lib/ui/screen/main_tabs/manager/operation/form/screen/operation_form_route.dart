import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_screen.dart';
import 'package:provider/provider.dart';

class OperationFormRoute extends BaseRoute<OperationFormRouteArgs, void>
    with MainTabRoute {
  OperationFormRoute.forRouter();

  OperationFormRoute({
    @required OperationFormRouteArgs argument,
  }) : super(argument: argument);

  @override
  String get routePath => '/manager/operation/create';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => OperationFormScreen(),
      settings: routeSettings,
    );
  }
}

class OperationFormRouteArgs {
  static OperationFormRouteArgs of(BuildContext context) =>
      Provider.of<OperationFormRouteArgs>(context, listen: false);

  OperationModel operation;

  OperationFormRouteArgs({
    this.operation,
  });

  static OperationFormRouteArgs create({
    AccountModel account,
  }) {
    var operation = OperationModelExtra.buildEmpty();

    operation = operation.copyWith(
      account: account,
      profile: account.profile,
    );

    return OperationFormRouteArgs(
      operation: operation,
    );
  }

  static OperationFormRouteArgs edit({
    OperationModel operation,
  }) {
    return OperationFormRouteArgs(
      operation: operation,
    );
  }

  static OperationFormRouteArgs copy({
    OperationModel operation,
  }) {
    return OperationFormRouteArgs(
      operation: operation.buildCopy(),
    );
  }
}
