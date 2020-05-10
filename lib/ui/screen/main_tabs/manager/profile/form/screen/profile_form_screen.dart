import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/bloc/profile_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/widget/profile_form_view.dart';

class ProfileFormScreen
    extends BaseScreen<ProfileFormBloc, ProfileFormRouteArgs> {
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
