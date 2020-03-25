import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/model/profile/index.dart';

part 'profile_dao.g.dart';

@UseDao(tables: [ProfileTable])
class ProfileDao extends DatabaseAccessor<DatabaseClient>
    with _$ProfileDaoMixin {
  ProfileDao(DatabaseClient database) : super(database);

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