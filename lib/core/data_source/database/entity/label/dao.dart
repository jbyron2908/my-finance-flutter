import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/label/table.dart';
import 'package:my_finance_flutter/core/model/label/label_converter.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';

part 'dao.g.dart';

@UseDao(tables: [LabelTable])
class LabelDao extends DatabaseAccessor<DatabaseClient> with _$LabelDaoMixin {
  LabelDao(DatabaseClient database) : super(database);

  Future<int> insert(LabelEntity entity) {
    return into(labelTable).insert(entity);
  }

  Stream<List<LabelModel>> watchAll() {
    return select(labelTable).watch().map((rows) {
      return rows.map(
        (resultRow) {
          return LabelConverter.toModel(
            resultRow,
          );
        },
      ).toList();
    });
  }
}
