import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/import_csv/result/screen/import_result_bloc.dart';
import 'package:my_finance_flutter/ui/view/import_csv/result/widget/import_result_view.dart';

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
