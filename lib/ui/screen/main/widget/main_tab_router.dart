import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/import_csv_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/screen/import_csv_result_screen.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/debug_tools/screen/debug_tools_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/screen/demo_populate_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/screen/balance_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/screen/account_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/screen/account_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/screen/category_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/screen/entity_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/screen/label_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/screen/label_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/screen/label_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/screen/operation_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/screen/operation_state_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/screen/operation_type_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/screen/payee_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/screen/payee_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/screen/profile_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/screen/profile_selection_screen.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/bottom_navigation_view.dart';

class MainTabRouter {
  List<RouteDefinition> get routeList => [
        MainScreen.routeDefinition,
        EntityListScreen.routeDefinition,
        BalanceScreen.routeDefinition,
        AccountViewerScreen.routeDefinition,
        ProfileFormScreen.routeDefinition,
        ProfileListScreen.routeDefinition,
        ProfileSelectionScreen.routeDefinition,
        AccountFormScreen.routeDefinition,
        AccountListScreen.routeDefinition,
        AccountSelectionScreen.routeDefinition,
        CategoryFormScreen.routeDefinition,
        CategoryListScreen.routeDefinition,
        CategorySelectionScreen.routeDefinition,
        PayeeFormScreen.routeDefinition,
        PayeeListScreen.routeDefinition,
        PayeeSelectionScreen.routeDefinition,
        LabelFormScreen.routeDefinition,
        LabelListScreen.routeDefinition,
        LabelSelectionScreen.routeDefinition,
        OperationFormScreen.routeDefinition,
        OperationListScreen.routeDefinition,
        OperationTypeSelectionScreen.routeDefinition,
        OperationStateSelectionScreen.routeDefinition,
        DebugToolsScreen.routeDefinition,
        DemoPopulateScreen.routeDefinition,
        ImportCsvFormScreen.routeDefinition,
        ImportCsvPreviewScreen.routeDefinition,
        ImportCsvResultScreen.routeDefinition,
      ];

  MainTabRouter(
    this.tabItemList,
  ) {
    currentTab = tabItemList.firstWhere(
      (tabItem) => tabItem.defaultTab,
    );
  }

  final List<TabItem> tabItemList;
  TabItem currentTab;

  static MainTabRouter get _instance => Get.find();
  NavigatorState get navigator => currentTab?.navigator;

  static Future navigateTo(String path, [Object argument]) {
    return _instance.navigator?.pushNamed(
      path,
      arguments: argument,
    );
  }

  static Future replaceTo(String path, [Object argument]) {
    return _instance.navigator?.pushReplacementNamed(
      path,
      arguments: argument,
    );
  }

  static void pop([Object result]) {
    _instance.navigator?.pop(result);
  }
}
