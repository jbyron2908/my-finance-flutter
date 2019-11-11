import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class ImportCsvFormBloc extends BaseBloc {
  static ImportCsvFormBloc of(BuildContext context) =>
      Provider.of<ImportCsvFormBloc>(context);

  ImportCsvFormBloc();

  @override
  List<SingleChildCloneableWidget> get dependencies => [];
}
