import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/controller/profile_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/widget/profile_selection_view.dart';

class ProfileSelectionScreen extends StatelessWidget {
  static String get _routePath => '/manager/profile/selection';
  static GetPageRoute get route => GetPageRoute<ProfileModel>(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => ProfileSelectionScreen(),
        binding: ProfileSelectionBinding(),
      );

  static Future<ProfileModel> navigateTo() {
    return MainTabRouter.navigateTo<ProfileModel>(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return ProfileSelectionView();
  }
}

class ProfileSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileSelectionController());
  }
}
