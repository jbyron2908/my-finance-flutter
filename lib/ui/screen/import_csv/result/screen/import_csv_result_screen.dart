import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/bloc/import_csv_result_bloc.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/widget/import_csv_result_view.dart';

class ImportCsvResultScreen extends BaseScreen<ImportCsvResultBloc> {
  @override
  Widget build(BuildContext context) {
    return ImportCsvResultView();
  }

  @override
  ImportCsvResultBloc buildBloc(BuildContext context) {
    return ImportCsvResultBloc();
  }
}
