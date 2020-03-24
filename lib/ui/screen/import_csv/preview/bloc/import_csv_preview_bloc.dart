import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class ImportCsvPreviewBloc extends BaseBloc {
  static ImportCsvPreviewBloc of(BuildContext context) =>
      Provider.of<ImportCsvPreviewBloc>(context, listen: false);

  ImportCsvPreviewBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
