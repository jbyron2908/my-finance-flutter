import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/bloc/import_csv_result_bloc.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/widget/import_csv_result_view.dart';
import 'package:provider/provider.dart';

class ImportCsvResultScreen
    extends BaseScreen<ImportCsvResultBloc, ImportCsvResultScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return ImportCsvResultView();
  }

  @override
  ImportCsvResultBloc buildBloc(BuildContext context) {
    return ImportCsvResultBloc();
  }
}

class ImportCsvResultScreenArgs {
  static ImportCsvResultScreenArgs of(BuildContext context) =>
      Provider.of<ImportCsvResultScreenArgs>(context, listen: false);

  int field1;

  ImportCsvResultScreenArgs({
    this.field1,
  });
}
