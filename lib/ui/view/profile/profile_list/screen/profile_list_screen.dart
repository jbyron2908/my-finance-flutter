import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_list/screen/profile_list_bloc.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_list/screen/profile_list_route.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_list/widget/profile_list_view.dart';

class ProfileListScreen extends BaseScreen<ProfileListBloc> {
  ProfileListScreen(ProfileListRouteArgs argument);

  @override
  Widget build(BuildContext context) {
    return ProfileListView();
  }

  @override
  ProfileListBloc buildBloc(BuildContext context) {
    return ProfileListBloc();
  }
}
