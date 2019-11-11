import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class ImportCsvResultBloc extends BaseBloc {
  static ImportCsvResultBloc of(BuildContext context) =>
      Provider.of<ImportCsvResultBloc>(context);

  ImportCsvResultBloc();

  @override
  List<SingleChildCloneableWidget> get dependencies => [];
}
