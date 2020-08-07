import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/controller/profile_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/controller/profile_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/widget/profile_form_view.dart';

class ProfileFormScreen extends StatelessWidget {
  static String get _routePath => '/manager/profile/form';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => ProfileFormScreen(),
        binding: ProfileFormBinding(),
      );

  static void navigateTo(ProfileFormArg argument) {
    MainTabRouter.navigateTo(_routePath, argument);
  }

  final ProfileFormViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments;
    viewModel.setArgument(arguments);
    return ProfileFormView();
  }
}

class ProfileFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileFormViewModel());
    Get.put(ProfileFormController());
  }
}

class ProfileFormArg {
  ProfileModel profile;

  ProfileFormArg(this.profile);

  static ProfileFormArg create() {
    var profile = ProfileModel();

    return ProfileFormArg(profile);
  }

  static ProfileFormArg edit(ProfileModel profile) {
    return ProfileFormArg(profile);
  }
}
