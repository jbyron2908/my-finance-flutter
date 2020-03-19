import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/profile/selection/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/profile/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/profile/selection/widget/view.dart';

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
