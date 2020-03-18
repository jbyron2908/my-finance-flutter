import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class ProfileListBloc extends BaseBloc {
  static ProfileListBloc of(BuildContext context) =>
      Provider.of<ProfileListBloc>(context);

  ProfileListBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
