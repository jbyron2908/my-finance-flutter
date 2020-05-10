import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/bloc/profile_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/screen/profile_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/widget/profile_list_view.dart';

class ProfileListScreen
    extends BaseScreen<ProfileListBloc, ProfileListRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return ProfileListView();
  }

  @override
  ProfileListBloc buildBloc(BuildContext context) {
    return ProfileListBloc(
      context: context,
    );
  }
}
