import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/account_selection_view.dart';

class AccountSelectionRoute extends BaseRoute {
  @override
  String get routePath => "/account/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<AccountModel>(
      builder: (context) => AccountSelectionView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
