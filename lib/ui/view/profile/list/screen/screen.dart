import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/profile/list/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/profile/list/screen/route.dart';
import 'package:my_finance_flutter/ui/view/profile/list/widget/view.dart';

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
