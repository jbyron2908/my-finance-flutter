import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
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
}
