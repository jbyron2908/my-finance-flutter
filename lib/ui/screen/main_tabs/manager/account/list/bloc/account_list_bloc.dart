import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_route.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class AccountListBloc extends BaseBloc {
  static AccountListBloc of(BuildContext context) =>
      Provider.of<AccountListBloc>(context, listen: false);

  final BuildContext context;
  AccountRepository _accountRepository;

  AccountListBloc({
    @required this.context,
  }) {
    _accountRepository = AccountRepository.of(context);
  }

  Future deleteAccount(AccountModel account) {
    return _accountRepository.delete(account);
  }

  void editAccount(AccountModel account) {
    AccountFormRoute(
      argument: AccountFormRouteArgs.edit(account: account),
    ).navigateIntoTab(context);
  }

  @override
  List<SingleChildWidget> get dependencies => [];
}
