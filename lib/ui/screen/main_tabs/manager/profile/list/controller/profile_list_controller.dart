import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_screen.dart';

class ProfileListController extends GetxController {
  final ProfileRepository _profileRepository = Get.find();

  Future deleteProfile(ProfileModel profile) {
    return _profileRepository.delete(profile);
  }

  void editProfile(ProfileModel profile) {
    ProfileFormScreen.navigateTo(ProfileFormArg.edit(profile: profile));
  }
}
