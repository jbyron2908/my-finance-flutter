import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class ProfileSelectionBloc extends BaseBloc {
  static ProfileSelectionBloc of(BuildContext context) =>
      Provider.of<ProfileSelectionBloc>(context, listen: false);

  ProfileSelectionBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
