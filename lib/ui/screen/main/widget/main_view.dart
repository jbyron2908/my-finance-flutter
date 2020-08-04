import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/bottom_navigation_view.dart';

class MainView extends StatelessWidget {
  final MainTabRouter mainTabRouter = Get.find();

  @override
  Widget build(BuildContext context) {
    var navigationHandler = NavigationHandler(mainTabRouter.routeList);

    return BottomNavigationView(
      tabList: mainTabRouter.tabItemList,
      routeGenerator: navigationHandler.routeGenerator,
      onCurrentTabChange: (newCurrentTab) {
        mainTabRouter.currentTab = newCurrentTab;
      },
    );
  }
}
