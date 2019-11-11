import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/screen/import_form_bloc.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/widget/import_form_view.dart';

class ImportCsvFormScreen extends BaseScreen<ImportFormBloc> {
  @override
  Widget build(BuildContext context) {
    return ImportCsvFormView();
  }

  @override
  ImportFormBloc buildBloc(BuildContext context) {
    return ImportFormBloc();
  }
}
