import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class MainBloc extends BaseBloc {
  static MainBloc of(BuildContext context) =>
      Provider.of<MainBloc>(context);

  MainBloc();

  @override
  List<SingleChildCloneableWidget> get dependencies => [];

}
