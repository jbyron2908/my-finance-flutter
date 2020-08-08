import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_screen.dart';

class AccountFormViewModel extends GetxController {
  final RxString name = ''.obs;
  final RxString type = ''.obs;
  final Rx<ProfileModel> profile = Rx();

  AccountFormArg argument;

  void setArgument(AccountFormArg argument) {
    this.argument = argument;
    var account = argument.account;

    name.value = account.name;
    type.value = account.type;
  }

  AccountModel buildForm() {
    var account = argument.account;

    return account.copyWith(
      name: name.value,
      type: type.value,
      profile: profile.value,
    );
  }
}
