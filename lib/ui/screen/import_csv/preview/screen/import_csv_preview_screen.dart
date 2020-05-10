import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/bloc/import_csv_preview_bloc.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/widget/import_csv_preview_view.dart';

class ImportCsvPreviewScreen
    extends BaseScreen<ImportCsvPreviewBloc, ImportCsvPreviewRouteArgs> {
  @override
  Widget build(BuildContext context) {
    var argument = ImportCsvPreviewRouteArgs.of(context);

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
