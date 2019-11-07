import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class AccountListBloc extends BaseBloc {
  static AccountListBloc of(BuildContext context) =>
      Provider.of<AccountListBloc>(context);

  final AccountRepository accountRepository;

  AccountListBloc({
    this.accountRepository,
  });

  @override
  List<SingleChildCloneableWidget> get dependencies => [];
}
