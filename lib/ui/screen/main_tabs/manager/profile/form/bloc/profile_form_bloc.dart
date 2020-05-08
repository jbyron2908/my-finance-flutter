import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/bloc/profile_form_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class ProfileFormBloc extends BaseBloc {
  static ProfileFormBloc of(BuildContext context) =>
      Provider.of<ProfileFormBloc>(context, listen: false);

  ProfileFormViewModel _viewModel;
  ProfileRepository _profileRepository;

  final BuildContext context;
  final formKey = GlobalKey<FormState>();

  ProfileFormBloc(
    this.context, {
    ProfileModel profile,
  }) {
    _profileRepository = ProfileRepository.of(context);
    _viewModel = ProfileFormViewModel(profile);
  }

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _profileRepository.save(_viewModel.profile);
      MainTabRouter.of(context).pop();
    }
  }

  void cancel() async {
    MainTabRouter.of(context).pop();
  }

  @override
  List<SingleChildWidget> get dependencies => [
        ChangeNotifierProvider.value(
          value: _viewModel,
        )
      ];
}
