import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/provider/model/profile_model.dart';

part 'profile_dao.g.dart';

@UseDao(tables: [ProfileTable])
class ProfileDao extends DatabaseAccessor<DatabaseClient>
    with _$ProfileDaoMixin {
  ProfileDao(DatabaseClient db) : super(db);

  Future<int> insert(ProfileEntity entity) {
    return into(profileTable).insert(entity);
  }

  Stream<List<ProfileModel>> watchAll() {
    return select(profileTable).watch().map(
          (rows) => rows
              .map(
                (entity) => ProfileConverter.toModel(entity),
              )
              .toList(),
        );
  }
}
