import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/label/label_table.dart';
import 'package:my_finance_flutter/core/model/label/label_converter.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';

part 'label_dao.g.dart';

@UseDao(tables: [LabelTable])
class LabelDao extends BaseDao<LabelEntity, LabelModel> with _$LabelDaoMixin {
  LabelDao(DatabaseClient database) : super(database);

  @override
  Table get table => labelTable;

  // Write

  Future markDelete(LabelEntity entity) {
    var deletedLabel = entity.copyWith(
      deleted: true,
    );
    return update(labelTable).replace(deletedLabel);
  }

  // Read

  Stream<List<LabelModel>> watchAll() {
    var query = getBaseQuery();

    query
      ..where(
        labelTable.deleted.equals(false),
      );

    return mapQuery(query);
  }

  // Base

  @override
  JoinedSelectStatement getBaseQuery() {
    return select(labelTable).join([]);
  }

  @override
  Stream<List<LabelModel>> mapQuery(
    JoinedSelectStatement query,
  ) {
    return query.watch().map(
      (rows) {
        return rows.map(
          (resultRow) {
            return LabelConverter.toModel(
              resultRow.readTable(labelTable),
            );
          },
        ).toList();
      },
    );
  }
}
