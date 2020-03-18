import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class ImportCsvFormBloc extends BaseBloc {
  static ImportCsvFormBloc of(BuildContext context) =>
      Provider.of<ImportCsvFormBloc>(context, listen: false);

  ImportCsvFormBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
