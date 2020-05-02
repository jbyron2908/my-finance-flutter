import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';

mixin MainTabRoute<T> on BaseRoute<T> {
  Future<T> navigateIntoTab<T>(BuildContext context) {
    return MainTabRouter.of(context).navigateTo(this);
  }

  Future<T> replaceIntoTab<T>(BuildContext context) {
    return MainTabRouter.of(context).replaceTo(this);
  }
}
