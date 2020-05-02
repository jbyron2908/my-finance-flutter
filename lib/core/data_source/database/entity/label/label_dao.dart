import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/label/label_table.dart';
import 'package:my_finance_flutter/core/model/label/label_converter.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';

part 'label_dao.g.dart';

@UseDao(tables: [LabelTable])
class LabelDao extends DatabaseAccessor<DatabaseClient> with _$LabelDaoMixin {
  LabelDao(DatabaseClient database) : super(database);

  // Write

  Future save(LabelEntity entity) {
    if (entity.id == null) {
      return into(labelTable).insert(entity);
    } else {
      return update(labelTable).replace(entity);
    }
  }

  Future markDelete(LabelEntity entity) {
    var deletedLabel = entity.copyWith(
      deleted: true,
    );
    return update(labelTable).replace(deletedLabel);
  }

  // Read

  Stream<List<LabelModel>> watchAll() {
    var query = _getBaseQuery();

    query
      ..where(
        (label) => label.deleted.equals(false),
      );

    return _mapQuery(query);
  }

  // Base

  SimpleSelectStatement<$LabelTableTable, LabelEntity> _getBaseQuery() {
    return select(labelTable);
  }

  Stream<List<LabelModel>> _mapQuery(
      SimpleSelectStatement<$LabelTableTable, LabelEntity> query) {
    return query.watch().map(
      (rows) {
        return rows.map(
          (resultRow) {
            return LabelConverter.toModel(
              resultRow,
            );
          },
        ).toList();
      },
    );
  }
}
