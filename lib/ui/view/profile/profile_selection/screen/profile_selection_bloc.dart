import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class ProfileSelectionBloc extends BaseBloc {
  static ProfileSelectionBloc of(BuildContext context) =>
      Provider.of<ProfileSelectionBloc>(context);

  ProfileSelectionBloc();

  @override
  List<SingleChildCloneableWidget> get dependencies => [];

}
