import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/router/base_router.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/import_csv_form_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/screen/import_csv_result_route.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/screen/balance_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/screen/account_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/screen/category_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/screen/entity_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/screen/label_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/screen/label_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/screen/label_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/screen/operation_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/screen/operation_state_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/screen/operation_type_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/screen/payee_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/screen/payee_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/screen/playground_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/screen/profile_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/screen/profile_selection_route.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/bottom_navigation_view.dart';
import 'package:provider/provider.dart';

class MainTabRouter extends BaseRouter {
  static MainTabRouter of(BuildContext context) =>
      Provider.of<MainTabRouter>(context, listen: false);

  MainTabRouter({
    this.tabItem,
  });

  final TabItem tabItem;

  @override
  List<BaseRoute> get routeList => [
        EntityListRoute.forRouter(),
        BalanceRoute.forRouter(),
        AccountViewerRoute.forRouter(),
        MainRoute.forRouter(),
        ProfileFormRoute.forRouter(),
        ProfileListRoute.forRouter(),
        ProfileSelectionRoute.forRouter(),
        AccountFormRoute.forRouter(),
        AccountListRoute.forRouter(),
        AccountSelectionRoute.forRouter(),
        CategoryFormRoute.forRouter(),
        CategoryListRoute.forRouter(),
        CategorySelectionRoute.forRouter(),
        PayeeFormRoute.forRouter(),
        PayeeListRoute.forRouter(),
        PayeeSelectionRoute.forRouter(),
        LabelFormRoute.forRouter(),
        LabelListRoute.forRouter(),
        LabelSelectionRoute.forRouter(),
        OperationFormRoute.forRouter(),
        OperationListRoute.forRouter(),
        OperationTypeSelectionRoute.forRouter(),
        OperationStateSelectionRoute.forRouter(),
        ImportCsvFormRoute.forRouter(),
        ImportCsvPreviewRoute.forRouter(),
        ImportCsvResultRoute.forRouter(),
        PlaygroundRoute.forRouter(),
      ];

  Future<T> navigateTo<T>(BaseRoute route) {
    return tabItem.navigator.currentState.pushNamed<T>(
      route.routePath,
      arguments: route.argument,
    );
  }

  Future<T> replaceTo<T>(BaseRoute route) {
    return tabItem.navigator.currentState.pushReplacementNamed(
      route.routePath,
      arguments: route.argument,
    );
  }

  void pop([Object result]) {
    tabItem.navigator.currentState.pop(result);
  }
}

mixin MainTabRoute<T, R> on BaseRoute<T, R> {
  Future<R> navigateIntoTab(BuildContext context) {
    return MainTabRouter.of(context).navigateTo(this);
  }

  Future<R> replaceIntoTab(BuildContext context) {
    return MainTabRouter.of(context).replaceTo(this);
  }
}
