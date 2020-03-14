import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_selection/screen/profile_selection_bloc.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_selection/screen/profile_selection_route.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_selection/widget/profile_selection_view.dart';

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
