import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/controller/entity_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/widget/entity_list_view.dart';

class EntityListScreen extends StatelessWidget {
  static String get _routePath => '/home/manager';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => EntityListScreen(),
        binding: EntityListBinding(),
      );

  @override
  Widget build(BuildContext context) {
    return EntityListView();
  }
}

class EntityListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EntityListController());
  }
}
