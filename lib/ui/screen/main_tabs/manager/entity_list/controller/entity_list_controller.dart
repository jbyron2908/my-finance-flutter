import 'package:get/get.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/import_csv_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/screen/account_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/screen/category_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/screen/label_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/screen/label_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/screen/operation_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/screen/payee_list_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/screen/playground_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/screen/profile_list_screen.dart';

class EntityListController extends GetxController {
  void goToProfileList() {
    ProfileListScreen.navigateTo();
  }

  void goToAccountList() {
    AccountListScreen.navigateTo();
  }

  void goToCategoryList() {
    CategoryListScreen.navigateTo();
  }

  void goToOperationList() {
    OperationListScreen.navigateTo();
  }

  void goToPayeeList() {
    PayeeListScreen.navigateTo();
  }

  void goToPlayground() {
    PlaygroundScreen.navigateTo();
  }

  void goToLabelList() {
    LabelListScreen.navigateTo();
  }

  Future goToLabelListSelection() async {
    var labelList = await LabelSelectionScreen.navigateTo();
    Log.i(labelList);
  }

  void goToImportCsv() {
    ImportCsvFormScreen.navigateTo();
  }
}
