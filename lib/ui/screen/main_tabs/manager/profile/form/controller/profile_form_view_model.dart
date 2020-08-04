import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_screen.dart';

class ProfileFormViewModel extends GetxController {
  final RxString name = ''.obs;
  final RxString currency = ''.obs;

  @override
  void onInit() {
    ProfileFormArg arguments = Get.arguments;
    var profile = arguments.profile;

    name.value = profile.name;
    currency.value = profile.currency;
  }

  ProfileModel buildProfile() {
    ProfileFormArg arguments = Get.arguments;
    var profile = arguments.profile;

    return profile.copyWith(
      name: name.value,
      currency: currency.value,
    );
  }
}
