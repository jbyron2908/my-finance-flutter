import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/tag/tag_table.dart';
import 'package:my_finance_flutter/core/model/tag/tag_converter.dart';
import 'package:my_finance_flutter/core/model/tag/tag_model.dart';

part 'tag_dao.g.dart';

@UseDao(tables: [TagTable])
class TagDao extends DatabaseAccessor<DatabaseClient> with _$TagDaoMixin {
  TagDao(DatabaseClient database) : super(database);

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
