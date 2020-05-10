import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/screen/entity_list_screen.dart';
import 'package:provider/provider.dart';

class EntityListRoute extends BaseRoute<EntityListRouteArgs, void>
    with MainTabRoute {
  EntityListRoute.forRouter();

  EntityListRoute({EntityListRouteArgs argument}) : super(argument: argument);

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

class EntityListRouteArgs {
  static EntityListRouteArgs of(BuildContext context) =>
      Provider.of<EntityListRouteArgs>(context, listen: false);

  int field1;

  EntityListRouteArgs({
    this.field1,
  });
}
