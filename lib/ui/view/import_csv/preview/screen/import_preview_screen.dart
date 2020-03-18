import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/screen/import_preview_bloc.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/widget/import_preview_view.dart';

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
