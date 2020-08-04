import 'package:get/get.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/template_operation/template_operation_converter.dart';
import 'package:my_finance_flutter/core/model/template_operation/template_operation_model.dart';

class TemplateOperationRepository {
  final DatabaseClient _databaseClient = Get.find();

  TemplateOperationRepository() {
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
