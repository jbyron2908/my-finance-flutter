import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/bloc/profile_selection_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/widget/profile_selection_view.dart';
import 'package:provider/provider.dart';

class ProfileSelectionScreen
    extends BaseScreen<ProfileSelectionBloc, ProfileSelectionScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return ProfileSelectionView();
  }

  @override
  ProfileSelectionBloc buildBloc(BuildContext context) {
    return ProfileSelectionBloc();
  }
}

class ProfileSelectionScreenArgs {
  static ProfileSelectionScreenArgs of(BuildContext context) =>
      Provider.of<ProfileSelectionScreenArgs>(context, listen: false);

  int field1;

  ProfileSelectionScreenArgs({
    this.field1,
  });
}
