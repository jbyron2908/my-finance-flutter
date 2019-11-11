import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class ImportCsvPreviewBloc extends BaseBloc {
  static ImportCsvPreviewBloc of(BuildContext context) =>
      Provider.of<ImportCsvPreviewBloc>(context);

  ImportCsvPreviewBloc();

  @override
  List<SingleChildCloneableWidget> get dependencies => [];
}
