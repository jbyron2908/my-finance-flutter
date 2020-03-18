import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class ProfileCreateBloc extends BaseBloc {
  static ProfileCreateBloc of(BuildContext context) =>
      Provider.of<ProfileCreateBloc>(context);

  ProfileCreateBloc(BuildContext context,
      {ProfileRepository profileRepository}) {
    _context = context;
    _profileRepository = profileRepository;
  }

  BuildContext _context;
  ProfileRepository _profileRepository;

  @override
  List<SingleChildCloneableWidget> get dependencies => [];

  Future<void> saveProfile(ProfileModel profile) async {
    await _profileRepository.save(profile);
    AppRouter.pop(_context);
  }
}
