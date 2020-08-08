import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/controller/profile_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/widget/profile_selection_view.dart';

class ProfileSelectionScreen extends StatelessWidget {
  static String get _routeName => '/manager/profile/selection';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute<ProfileModel>(
          settings: routeSetting,
          page: () => ProfileSelectionScreen(),
          binding: ProfileSelectionBinding(),
        ),
      );

  static Future<ProfileModel> navigateTo() {
    return MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ProfileSelectionView();
  }
}

class ProfileSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileSelectionController());
  }
}
