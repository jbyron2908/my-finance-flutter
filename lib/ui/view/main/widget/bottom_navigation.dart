import 'package:flutter/material.dart';

class TabItem {
  TabItem({
    this.id,
    this.title,
    this.iconData,
    this.activeColor = Colors.blue,
    this.rootPath,
  });

  final String id;
  final String title;
  final String rootPath;
  final IconData iconData;
  final Color activeColor;
  final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.tabList, this.currentTab, this.onSelectTab});

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
