import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/controller/profile_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/widget/profile_list_view.dart';

class ProfileListScreen extends StatelessWidget {
  static String get _routeName => '/manager/profile/list';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => ProfileListScreen(),
          binding: ProfileListBinding(),
        ),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ProfileListView();
  }
}

class ProfileListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileListController());
  }
}
