import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class ImportFormBloc extends BaseBloc {
  static ImportFormBloc of(BuildContext context) =>
      Provider.of<ImportFormBloc>(context);

  ImportFormBloc();

  @override
  List<SingleChildCloneableWidget> get dependencies => [];
}
