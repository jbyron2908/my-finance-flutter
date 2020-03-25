import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class AccountCreateBloc extends BaseBloc {
  static AccountCreateBloc of(BuildContext context) =>
      Provider.of<AccountCreateBloc>(context, listen: false);

  final AccountRepository accountRepository;

  AccountCreateBloc({
    this.accountRepository,
  });

  @override
  List<SingleChildWidget> get dependencies => [];

  Future saveAccount(AccountModel account) {
    return accountRepository.save(account);
  }
}
