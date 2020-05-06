import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';

mixin MainTabRoute<T> on BaseRoute<T> {
  Future navigateIntoTab(BuildContext context) {
    return MainTabRouter.of(context).navigateTo(this);
  }

  Future replaceIntoTab(BuildContext context) {
    return MainTabRouter.of(context).replaceTo(this);
  }
}
