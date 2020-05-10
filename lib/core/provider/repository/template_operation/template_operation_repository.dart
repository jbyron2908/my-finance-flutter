import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/template_operation/template_operation_converter.dart';
import 'package:my_finance_flutter/core/model/template_operation/template_operation_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class TemplateOperationRepository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, TemplateOperationRepository>(
        update: (context, databaseClient, repository) =>
            TemplateOperationRepository(databaseClient),
      );

  static TemplateOperationRepository of(BuildContext context) =>
      Provider.of<TemplateOperationRepository>(context, listen: false);

  final DatabaseClient _databaseClient;

  TemplateOperationRepository(this._databaseClient) {
    _templateOperationListStream =
        _databaseClient.templateOperationDao.watchAll();
  }

  Stream<List<TemplateOperationModel>> _templateOperationListStream;
  Stream<List<TemplateOperationModel>> get templateOperationListStream =>
      _templateOperationListStream;

  Future<int> save(TemplateOperationModel templateOperation) async {
    return _databaseClient.templateOperationDao.insert(
      TemplateOperationConverter.toEntity(templateOperation),
    );
  }
}
