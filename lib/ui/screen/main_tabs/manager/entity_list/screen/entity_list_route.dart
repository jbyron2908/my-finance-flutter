import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/screen/entity_list_screen.dart';

class EntityListRoute extends BaseRoute<EntityListScreenArgs>
    with MainTabRoute {
  EntityListRoute.forRouter();

  EntityListRoute({EntityListScreenArgs argument}) : super(argument: argument);

  @override
  String get routePath => '/manager/tab';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => EntityListScreen(),
      settings: routeSettings,
    );
  }
}
