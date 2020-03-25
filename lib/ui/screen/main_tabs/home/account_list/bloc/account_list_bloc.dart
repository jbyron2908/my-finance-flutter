import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class AccountListBloc extends BaseBloc {
  static AccountListBloc of(BuildContext context) =>
      Provider.of<AccountListBloc>(context, listen: false);

  AccountListBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
