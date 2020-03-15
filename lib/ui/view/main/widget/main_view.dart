import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/tab_router.dart';
import 'package:my_finance_flutter/ui/view/home/screen/home_route.dart';
import 'package:my_finance_flutter/ui/view/main/widget/bottom_navigation.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_list/screen/profile_list_route.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final Map<String, TabItem> _tabMap = {
    "home": TabItem(
      id: "home",
      title: "Home",
      iconData: Icons.home,
      rootPath: ProfileListRoute().routePath,
    ),
    "entity": TabItem(
      id: "management",
      title: "Management",
      iconData: Icons.category,
      rootPath: HomeRoute().routePath,
    ),
  };

  TabItem _homeTab;
  TabItem _currentTab;

  @override
  void initState() {
    _homeTab = _tabMap["home"];
    _currentTab = _tabMap["home"];
    super.initState();
  }

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _currentTab.navigator.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _currentTab.navigator.currentState.maybePop();

        if (isFirstRouteInCurrentTab) {
          if (_currentTab != _homeTab) {
            _selectTab(_homeTab);
            return false;
          }
        }

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: _tabMap.values
              .map(
                (tabItem) => _buildOffstageNavigator(tabItem),
              )
              .toList(),
        ),
        bottomNavigationBar: BottomNavigation(
          tabList: _tabMap.values.toList(),
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: Navigator(
        key: tabItem.navigator,
        initialRoute: tabItem.rootPath,
        onGenerateRoute: TabRouter.generateRoutes,
      ),
    );
  }
}
