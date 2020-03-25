import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class BalanceBloc extends BaseBloc {
  static BalanceBloc of(BuildContext context) =>
      Provider.of<BalanceBloc>(context, listen: false);

  BalanceBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
