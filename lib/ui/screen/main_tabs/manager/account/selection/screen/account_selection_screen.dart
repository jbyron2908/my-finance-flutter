import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/controller/account_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/widgets/account_selection_view.dart';

class AccountSelectionScreen extends StatelessWidget {
  static String get _routePath => '/manager/account/selection';
  static GetPageRoute get route => GetPageRoute<AccountModel>(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => AccountSelectionScreen(),
        binding: AccountSelectionBinding(),
      );

  static Future<AccountModel> navigateTo() {
    return AppRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return AccountSelectionView();
  }
}

class AccountSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AccountSelectionController());
  }
}
