import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class ImportPreviewBloc extends BaseBloc {
  static ImportPreviewBloc of(BuildContext context) =>
      Provider.of<ImportPreviewBloc>(context);

  ImportPreviewBloc();

  @override
  List<SingleChildCloneableWidget> get dependencies => [];
}
