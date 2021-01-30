import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/repository/account/account_repository.dart';
import 'package:my_finance_flutter/core/repository/profile/profile_repository.dart';

class AccountPopulateController extends GetxController {
  final ProfileRepository _profileRepository = Get.find();
  final AccountRepository _accountRepository = Get.find();

  Future<void> clearAll() async {
    await _accountRepository.clearAll();
    await _profileRepository.clearAll();
  }

  void populate() async {
    await clearAll();

    await populateBrazilProfile();
    await populateSwedenProfile();
  }

  void populateBrazilProfile() async {
    var profile = ProfileModel(
      id: 0,
      currency: 'R\$',
      name: 'Brasil',
    );

    var account1 = AccountModel(
      name: 'Nubank',
      type: 'Bank',
      profile: profile,
    );

    var account2 = AccountModel(
      name: 'Nubank CC',
      type: 'Credit card',
      profile: profile,
    );

    await _profileRepository.save(profile);
    await _accountRepository.save(account1);
    await _accountRepository.save(account2);
  }

  void populateSwedenProfile() async {
    var profile = ProfileModel(
      id: 1,
      currency: 'kr',
      name: 'Suecia',
    );

    var account1 = AccountModel(
      name: 'Handelsbanken',
      type: 'Bank',
      profile: profile,
    );

    var account2 = AccountModel(
      name: 'Norwegian',
      type: 'Credit card',
      profile: profile,
    );

    await _profileRepository.save(profile);
    await _accountRepository.save(account1);
    await _accountRepository.save(account2);
  }
}
