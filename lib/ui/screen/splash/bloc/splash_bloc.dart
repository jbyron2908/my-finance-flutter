import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class SplashBloc extends BaseBloc {
  static SplashBloc of(BuildContext context) =>
      Provider.of<SplashBloc>(context, listen: false);

  SplashBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
