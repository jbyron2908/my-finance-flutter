import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:provider/provider.dart';

class BottomNavigationView extends StatefulWidget {
  BottomNavigationView({
    this.tabList,
    this.routeGenerator,
  });

  final List<TabItem> tabList;
  final Route Function(RouteSettings routeSettings) routeGenerator;

  @override
  State<StatefulWidget> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  _BottomNavigationViewState();

  List<TabItem> tabList;
  Route Function(RouteSettings routeSettings) routeGenerator;

  TabItem _defaultTab;
  TabItem _currentTab;

  @override
  void initState() {
    tabList = widget.tabList;
    routeGenerator = widget.routeGenerator;
    _defaultTab = tabList.firstWhere(
      (tabItem) => tabItem.defaultTab,
      orElse: () => tabList.first,
    );
    _currentTab = _defaultTab;
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
          if (_currentTab != _defaultTab) {
            _selectTab(_defaultTab);
            return false;
          }
        }

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: tabList
              .map(
                (tabItem) => _buildOffstageNavigator(tabItem),
              )
              .toList(),
        ),
        bottomNavigationBar: BottomNavigation(
          tabList: tabList,
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Provider.value(
      value: MainTabRouter(tabItem: tabItem),
      child: Visibility(
        visible: _currentTab == tabItem,
        child: Navigator(
          key: tabItem.navigator,
          initialRoute: tabItem.rootPath,
          onGenerateRoute: routeGenerator,
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    this.tabList,
    this.currentTab,
    this.onSelectTab,
  });

  final List<TabItem> tabList;
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _buildItems(tabList: tabList),
      onTap: (index) => onSelectTab(
        tabList[index],
      ),
    );
  }

  List<BottomNavigationBarItem> _buildItems({List<TabItem> tabList}) {
    return tabList
        .map(
          (tabItem) => BottomNavigationBarItem(
            icon: Icon(
              tabItem.iconData,
              color: _colorTabMatching(tabItem),
            ),
            title: Text(
              tabItem.title,
              style: TextStyle(
                color: _colorTabMatching(tabItem),
              ),
            ),
          ),
        )
        .toList();
  }

  Color _colorTabMatching(TabItem tabItem) {
    return currentTab == tabItem ? tabItem.activeColor : Colors.grey;
  }
}

class TabItem {
  TabItem({
    this.id,
    this.title,
    this.iconData,
    this.activeColor = Colors.blue,
    this.rootPath,
    this.defaultTab = false,
  });

  final String id;
  final String title;
  final String rootPath;
  final IconData iconData;
  final Color activeColor;
  final bool defaultTab;
  final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
}
