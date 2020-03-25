import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/bloc/profile_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/widget/profile_list_view.dart';
import 'package:provider/provider.dart';

class ProfileListScreen
    extends BaseScreen<ProfileListBloc, ProfileListScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return ProfileListView();
  }

  @override
  ProfileListBloc buildBloc(BuildContext context) {
    return ProfileListBloc();
  }
}

class ProfileListScreenArgs {
  static ProfileListScreenArgs of(BuildContext context) =>
      Provider.of<ProfileListScreenArgs>(context, listen: false);

  int field1;

  ProfileListScreenArgs({
    this.field1,
  });
}
