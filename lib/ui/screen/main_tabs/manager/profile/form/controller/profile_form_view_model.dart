import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_screen.dart';

class ProfileFormViewModel extends GetxController {
  final RxString name = ''.obs;
  final RxString currency = ''.obs;
  ProfileFormArg argument;

  void setArgument(ProfileFormArg argument) {
    this.argument = argument;
    var profile = argument.profile;

    name.value = profile.name;
    currency.value = profile.currency;
  }

  ProfileModel buildForm() {
    var profile = argument.profile;

    return profile.copyWith(
      name: name.value,
      currency: currency.value,
    );
  }
}
