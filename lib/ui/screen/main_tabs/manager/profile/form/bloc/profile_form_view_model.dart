import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:provider/src/provider.dart';

class ProfileFormViewModel extends ChangeNotifier {
  static ProfileFormViewModel of(BuildContext context) =>
      Provider.of<ProfileFormViewModel>(context);

  ProfileFormViewModel(ProfileModel profile) {
    this.profile = profile;
  }

  ProfileModel _profile;

  ProfileModel get profile => _profile;

  set profile(ProfileModel profile) {
    _profile = profile;
    notifyListeners();
  }
}
