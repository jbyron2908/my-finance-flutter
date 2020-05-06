import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/screen/balance_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/screen/entity_list_route.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/model.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/view.dart';

class MainView extends StatelessWidget {
  final mainTabRouter = MainTabRouter();
  final homeRootPath = BalanceRoute().routePath;
  final managementRootPath = EntityListRoute().routePath;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationView(
      tabList: [
        TabItem(
          id: 'home',
          title: 'Home',
          iconData: Icons.home,
          rootPath: homeRootPath,
          defaultTab: true,
        ),
        TabItem(
          id: 'management',
          title: 'Management',
          iconData: Icons.business,
          rootPath: managementRootPath,
        ),
      ],
      routeGenerator: mainTabRouter.generateRoutes,
    );
  }
}
