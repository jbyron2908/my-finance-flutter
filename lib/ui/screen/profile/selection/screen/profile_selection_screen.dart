import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/profile/selection/bloc/profile_selection_bloc.dart';
import 'package:my_finance_flutter/ui/screen/profile/selection/screen/profile_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/profile/selection/widget/profile_selection_view.dart';

class ProfileSelectionScreen extends BaseScreen<ProfileSelectionBloc> {
  ProfileSelectionScreen(ProfileSelectionRouteArgs argument);

  @override
  Widget build(BuildContext context) {
    return ProfileSelectionView();
  }

  @override
  ProfileSelectionBloc buildBloc(BuildContext context) {
    return ProfileSelectionBloc();
  }
}
