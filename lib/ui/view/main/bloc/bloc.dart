import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class MainBloc extends BaseBloc {
  static MainBloc of(BuildContext context) =>
      Provider.of<MainBloc>(context, listen: false);

  MainBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
