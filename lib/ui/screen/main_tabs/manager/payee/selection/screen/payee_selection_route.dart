import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/screen/payee_selection_screen.dart';
import 'package:provider/provider.dart';

class PayeeSelectionRoute extends BaseRoute<PayeeSelectionRouteArgs, PayeeModel>
    with MainTabRoute {
  PayeeSelectionRoute.forRouter();

  PayeeSelectionRoute({PayeeSelectionRouteArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/payee/selection';

  @override
  MaterialPageRoute<PayeeModel> generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<PayeeModel>(
      builder: (context) => PayeeSelectionScreen(),
      settings: routeSettings,
    );
  }
}

class PayeeSelectionRouteArgs {
  static PayeeSelectionRouteArgs of(BuildContext context) =>
      Provider.of<PayeeSelectionRouteArgs>(context, listen: false);

  int field1;

  PayeeSelectionRouteArgs({
    this.field1,
  });
}
