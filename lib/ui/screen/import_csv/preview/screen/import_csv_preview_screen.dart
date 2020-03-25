import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/bloc/import_csv_preview_bloc.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/widget/import_csv_preview_view.dart';
import 'package:provider/provider.dart';

class ImportCsvPreviewScreen
    extends BaseScreen<ImportCsvPreviewBloc, ImportCsvPreviewScreenArgs> {
  @override
  Widget build(BuildContext context) {
    var argument = ImportCsvPreviewScreenArgs.of(context);

    return ImportCsvPreviewView(
      key: key,
      csvFile: argument.csvFile,
      account: argument.account,
    );
  }

  @override
  ImportCsvPreviewBloc buildBloc(BuildContext context) {
    return ImportCsvPreviewBloc();
  }
}

class ImportCsvPreviewScreenArgs {
  static ImportCsvPreviewScreenArgs of(BuildContext context) =>
      Provider.of<ImportCsvPreviewScreenArgs>(context, listen: false);

  final File csvFile;
  final AccountModel account;

  ImportCsvPreviewScreenArgs({
    this.csvFile,
    this.account,
  });
}
