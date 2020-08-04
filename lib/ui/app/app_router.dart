import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/import_csv_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/screen/import_csv_result_screen.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_screen.dart';
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
import 'package:my_finance_flutter/ui/screen/splash/screen/splash_screen.dart';

class AppRouter {
  List<GetPageRoute> get routeList => [
        SplashScreen.route,
        MainScreen.route,
        EntityListScreen.route,
        BalanceScreen.route,
        AccountViewerScreen.route,
        ProfileFormScreen.route,
        ProfileListScreen.route,
        ProfileSelectionScreen.route,
        AccountFormScreen.route,
        AccountListScreen.route,
        AccountSelectionScreen.route,
        CategoryFormScreen.route,
        CategoryListScreen.route,
        CategorySelectionScreen.route,
        PayeeFormScreen.route,
        PayeeListScreen.route,
        PayeeSelectionScreen.route,
        LabelFormScreen.route,
        LabelListScreen.route,
        LabelSelectionScreen.route,
        OperationFormScreen.route,
        OperationListScreen.route,
        OperationTypeSelectionScreen.route,
        OperationStateSelectionScreen.route,
        ImportCsvFormScreen.route,
        ImportCsvPreviewScreen.route,
        ImportCsvResultScreen.route,
      ];

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get navigator => navigatorKey.currentState;

  static AppRouter get _instance => Get.find();

  static Future<T> navigateTo<T>(String path, [Object argument]) {
    return _instance.navigator.pushNamed(
      path,
      arguments: argument,
    );
  }

  static Future<T> replaceTo<T>(String path, [Object argument]) {
    return _instance.navigator.pushReplacementNamed(
      path,
      arguments: argument,
    );
  }

  static void pop([Object result]) {
    _instance.navigator.pop(result);
  }
}
