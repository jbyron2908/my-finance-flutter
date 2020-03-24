import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/widget/view.dart';

class ImportCsvFormScreen extends BaseScreen<ImportCsvFormBloc> {
  @override
  Widget build(BuildContext context) {
    return ImportCsvFormView();
  }

  @override
  ImportCsvFormBloc buildBloc(BuildContext context) {
    return ImportCsvFormBloc();
  }
}
