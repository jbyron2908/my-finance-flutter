import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationView extends StatefulWidget {
  BottomNavigationView({
    @required this.tabList,
    @required this.routeGenerator,
    this.onCurrentTabChange,
  });

  final List<TabItem> tabList;
  final Route Function(RouteSettings routeSettings) routeGenerator;
  final Function(TabItem) onCurrentTabChange;

  @override
  State<StatefulWidget> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  _BottomNavigationViewState();

  List<TabItem> tabList;
  Route Function(RouteSettings routeSettings) routeGenerator;

  int _defaultIndex;
  int _currentIndex;
  TabItem get _currentTab => tabList[_currentIndex];

  @override
  void initState() {
    tabList = widget.tabList;
    routeGenerator = widget.routeGenerator;

    _defaultIndex = tabList.indexWhere((tabItem) => tabItem.defaultTab);
    if (_defaultIndex == -1) {
      _defaultIndex = 0;
    }

    _currentIndex = _defaultIndex;
    super.initState();
  }

  void _selectTab(int tabIndex) {
    if (tabIndex == _currentIndex) {
      tabList[_currentIndex]
          .navigatorKey
          .currentState
          .popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentIndex = tabIndex;
        if (widget.onCurrentTabChange != null) {
          widget.onCurrentTabChange(_currentTab);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _currentTab.navigatorKey.currentState.maybePop();

        if (isFirstRouteInCurrentTab) {
          if (_currentIndex != _defaultIndex) {
            _selectTab(_defaultIndex);
            return false;
          }
        }

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: tabList
              .map(
                (tabItem) => _buildNestedNavigator(tabItem),
              )
              .toList(),
        ),
        bottomNavigationBar: BottomNavigation(
          tabList: tabList,
          currentIndex: _currentIndex,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildNestedNavigator(TabItem tabItem) {
    return Visibility(
      maintainState: true,
      visible: _currentTab == tabItem,
      child: Navigator(
        key: tabItem.navigatorKey,
        initialRoute: tabItem.rootPath,
        onGenerateRoute: widget.routeGenerator,
        observers: [
          GetObserver(null, Routing()),
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    this.tabList,
    this.currentIndex,
    this.currentTab,
    this.onSelectTab,
  });

  final List<TabItem> tabList;
  final int currentIndex;
  final TabItem currentTab;
  final ValueChanged<int> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      items: _buildItems(tabList: tabList),
      onTap: (index) => onSelectTab(
        index,
      ),
    );
  }

  List<BottomNavigationBarItem> _buildItems({List<TabItem> tabList}) {
    return tabList
        .map(
          (tabItem) => BottomNavigationBarItem(
            icon: Icon(
              tabItem.iconData,
            ),
            label: tabItem.title,
          ),
        )
        .toList();
  }
}

class TabItem {
  TabItem({
    this.id,
    this.getId,
    this.title,
    this.iconData,
    this.activeColor = Colors.blue,
    this.rootPath,
    this.defaultTab = false,
  });

  final String id;
  final int getId;
  final String title;
  final String rootPath;
  final IconData iconData;
  final Color activeColor;
  final bool defaultTab;
  GlobalKey<NavigatorState> get navigatorKey => Get.nestedKey(getId);

  NavigatorState get navigator => navigatorKey.currentState;
}
