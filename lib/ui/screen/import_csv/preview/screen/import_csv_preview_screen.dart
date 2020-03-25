import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/bloc/import_csv_preview_bloc.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/widget/import_csv_preview_view.dart';

class ImportCsvPreviewScreen extends BaseScreen<ImportCsvPreviewBloc> {
  ImportCsvPreviewScreen({Key key, this.csvFile, this.account})
      : super(key: key);

  final File csvFile;
  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return ImportCsvPreviewView(
      key: key,
      csvFile: csvFile,
      account: account,
    );
  }

  @override
  ImportCsvPreviewBloc buildBloc(BuildContext context) {
    return ImportCsvPreviewBloc();
  }
}
