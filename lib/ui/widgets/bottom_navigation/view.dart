import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/model.dart';

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
    return Offstage(
      offstage: _currentTab != tabItem,
      child: Navigator(
        key: tabItem.navigator,
        initialRoute: tabItem.rootPath,
        onGenerateRoute: routeGenerator,
      ),
    );
  }
}
