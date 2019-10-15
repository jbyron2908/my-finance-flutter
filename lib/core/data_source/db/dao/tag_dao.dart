import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/table/tag_table.dart';
import 'package:my_finance_flutter/core/provider/model/tag_model.dart';

part 'tag_dao.g.dart';

@UseDao(tables: [TagTable])
class TagDao extends DatabaseAccessor<DatabaseClient> with _$TagDaoMixin {
  TagDao(DatabaseClient db) : super(db);

  Future<int> insert(TagEntity entity) {
    return into(tagTable).insert(entity);
  }

  Stream<List<TagModel>> watchAll() {
    return select(tagTable).watch().map((rows) {
      return rows.map(
        (resultRow) {
          return TagConverter.toModel(
            resultRow,
          );
        },
      ).toList();
    });
  }
}
