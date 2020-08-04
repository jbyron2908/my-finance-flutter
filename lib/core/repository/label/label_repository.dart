import 'package:get/get.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/label/label_converter.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';

class LabelRepository {
  final DatabaseClient _databaseClient = Get.find();

  LabelRepository() {
    _labelListStream = _databaseClient.labelDao.watchAll();
  }

  Stream<List<LabelModel>> _labelListStream;
  Stream<List<LabelModel>> get labelListStream => _labelListStream;

  Future save(LabelModel model) async {
    return _databaseClient.labelDao.save(
      LabelConverter.toEntity(model),
    );
  }

  Future delete(LabelModel label) async {
    return _databaseClient.labelDao.markDelete(LabelConverter.toEntity(label));
  }
}
