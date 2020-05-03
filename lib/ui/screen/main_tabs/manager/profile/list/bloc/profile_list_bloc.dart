import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_screen.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class ProfileListBloc extends BaseBloc {
  static ProfileListBloc of(BuildContext context) =>
      Provider.of<ProfileListBloc>(context, listen: false);

  final BuildContext context;
  ProfileRepository _profileRepository;

  ProfileListBloc({
    @required this.context,
  }) {
    _profileRepository = ProfileRepository.of(context);
  }

  @override
  List<SingleChildWidget> get dependencies => [];

  Future deleteProfile(ProfileModel profile) {
    return _profileRepository.delete(profile);
  }

  void editProfile(ProfileModel profile) {
    ProfileFormRoute(
      argument: ProfileFormScreenArgs.edit(profile: profile),
    ).navigateIntoTab(context);
  }
}
