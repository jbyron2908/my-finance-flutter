import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/bloc/import_csv_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/import_csv_form_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/widget/import_csv_form_view.dart';

class ImportCsvFormScreen
    extends BaseScreen<ImportCsvFormBloc, ImportCsvFormRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return ImportCsvFormView();
  }

  @override
  ImportCsvFormBloc buildBloc(BuildContext context) {
    return ImportCsvFormBloc();
  }
}
