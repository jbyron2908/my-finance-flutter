import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/bloc/account_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/screen/profile_selection_route.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class AccountFormBloc extends BaseBloc {
  static AccountFormBloc of(BuildContext context) =>
      Provider.of<AccountFormBloc>(context, listen: false);

  AccountRepository _accountRepository;
  AccountFormViewModel _viewModel;

  final BuildContext context;
  final formKey = GlobalKey<FormState>();

  AccountFormBloc(
    this.context, {
    AccountModel account,
  }) {
    _accountRepository = AccountRepository.of(context);
    _viewModel = AccountFormViewModel(account);
  }

  Future saveAccount(AccountModel account) {
    return _accountRepository.save(account);
  }

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _accountRepository.save(_viewModel.account);
      MainTabRouter.of(context).pop();
    }
  }

  void cancel() async {
    MainTabRouter.of(context).pop();
  }

  Future<ProfileModel> selectProfile() {
    return ProfileSelectionRoute().navigateIntoTab(context);
  }

  @override
  List<SingleChildWidget> get dependencies => [
        ChangeNotifierProvider.value(
          value: _viewModel,
        )
      ];
}
