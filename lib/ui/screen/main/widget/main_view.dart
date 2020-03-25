import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/screen/balance_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/tab/screen/home_route.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/model.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/view.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationView(
      tabList: [
        TabItem(
          id: "home",
          title: "Home",
          iconData: Icons.home,
          rootPath: BalanceRoute().routePath,
          defaultTab: true,
        ),
        TabItem(
          id: "management",
          title: "Management",
          iconData: Icons.category,
          rootPath: HomeRoute().routePath,
        ),
      ],
      routeGenerator: TabRouter.generateRoutes,
    );
  }
}
