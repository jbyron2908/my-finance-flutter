import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class AccountListBloc extends BaseBloc {
  static AccountListBloc of(BuildContext context) =>
      Provider.of<AccountListBloc>(context, listen: false);

  final AccountRepository accountRepository;

  AccountListBloc({
    this.accountRepository,
  });

  @override
  List<SingleChildWidget> get dependencies => [];

  void editAccount(AccountModel account) {}

  deleteAccount(AccountModel account) {}
}
