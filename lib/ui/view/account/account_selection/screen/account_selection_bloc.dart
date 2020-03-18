import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class AccountSelectionBloc extends BaseBloc {
  static AccountSelectionBloc of(BuildContext context) =>
      Provider.of<AccountSelectionBloc>(context);

  final AccountRepository accountRepository;

  AccountSelectionBloc({
    this.accountRepository,
  });

  @override
  List<SingleChildWidget> get dependencies => [];
}
