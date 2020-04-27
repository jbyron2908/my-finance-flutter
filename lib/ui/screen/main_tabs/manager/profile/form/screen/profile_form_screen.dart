import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/profile_repository.dart';
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
    return ProfileFormBloc(
      context,
      profileRepository: ProfileRepository.of(context),
    );
  }
}

class ProfileFormScreenArgs {
  static ProfileFormScreenArgs of(BuildContext context) =>
      Provider.of<ProfileFormScreenArgs>(context, listen: false);

  int field1;

  ProfileFormScreenArgs({
    this.field1,
  });
}
