import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/tab_router.dart';
import 'package:my_finance_flutter/ui/view/home/screen/home_route.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_list/screen/profile_list_route.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/bottom_navigation_view.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationView(
      tabList: [
        TabItem(
          id: "home",
          title: "Home",
          iconData: Icons.home,
          rootPath: ProfileListRoute().routePath,
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
