import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/repository.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class ProfileCreateBloc extends BaseBloc {
  static ProfileCreateBloc of(BuildContext context) =>
      Provider.of<ProfileCreateBloc>(context, listen: false);

  ProfileCreateBloc(BuildContext context,
      {ProfileRepository profileRepository}) {
    _context = context;
    _profileRepository = profileRepository;
  }

  BuildContext _context;
  ProfileRepository _profileRepository;

  @override
  List<SingleChildWidget> get dependencies => [];

  Future<void> saveProfile(ProfileModel profile) async {
    await _profileRepository.save(profile);
    AppRouter.pop(_context);
  }
}
