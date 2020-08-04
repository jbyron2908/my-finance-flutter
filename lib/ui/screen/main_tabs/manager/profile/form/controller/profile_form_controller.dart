import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/controller/profile_form_view_model.dart';

class ProfileFormController extends GetxController {
  final ProfileFormViewModel _viewModel = Get.find();
  final ProfileRepository _profileRepository = Get.find();

  final formKey = GlobalKey<FormState>();

  void submit() async {
    Get.focusScope.requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _profileRepository.save(_viewModel.buildProfile());
      MainTabRouter.pop();
    }
  }

  void cancel() async {
    MainTabRouter.pop();
  }
}
