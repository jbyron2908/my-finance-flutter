import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/index.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/ui/app/router/tab_router.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
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
    TabRouter.of(_context).pop();
  }
}
