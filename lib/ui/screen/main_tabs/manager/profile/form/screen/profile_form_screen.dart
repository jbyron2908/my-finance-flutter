import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/bloc/profile_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/widget/profile_form_view.dart';
import 'package:provider/provider.dart';

class ProfileFormScreen
    extends BaseScreen<ProfileFormBloc, ProfileFormScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return ProfileFormView();
  }

  @override
  ProfileFormBloc buildBloc(BuildContext context) {
    var argument = getArgument(context);

    return ProfileFormBloc(
      context,
      profile: argument.profile,
    );
  }
}

class ProfileFormScreenArgs {
  static ProfileFormScreenArgs of(BuildContext context) =>
      Provider.of<ProfileFormScreenArgs>(context, listen: false);

  ProfileModel profile;

  ProfileFormScreenArgs({
    this.profile,
  });

  static ProfileFormScreenArgs create() {
    var profile = ProfileModel();

    return ProfileFormScreenArgs(
      profile: profile,
    );
  }

  static ProfileFormScreenArgs edit({
    ProfileModel profile,
  }) {
    return ProfileFormScreenArgs(
      profile: profile,
    );
  }
}
