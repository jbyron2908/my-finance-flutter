import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_create/screen/profile_create_bloc.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_create/screen/profile_create_route.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_create/widget/profile_create_view.dart';

class ProfileCreateScreen extends BaseScreen<ProfileCreateBloc> {
  ProfileCreateScreen(ProfileCreateRouteArgs argument);

  @override
  Widget build(BuildContext context) {
    return ProfileCreateView();
  }

  @override
  ProfileCreateBloc buildBloc(BuildContext context) {
    return ProfileCreateBloc(
      context,
      profileRepository: ProfileRepository.of(context),
    );
  }
}
