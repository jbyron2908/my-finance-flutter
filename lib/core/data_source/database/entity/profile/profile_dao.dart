import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/model/profile/profile_converter.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';

part 'profile_dao.g.dart';

@UseDao(tables: [ProfileTable])
class ProfileDao extends DatabaseAccessor<DatabaseClient>
    with _$ProfileDaoMixin {
  ProfileDao(DatabaseClient database) : super(database);

  // Write

  Future save(ProfileEntity entity) {
    return into(profileTable).insertOnConflictUpdate(entity);
  }

  Future markDelete(ProfileEntity entity) {
    var deletedProfile = entity.copyWith(
      deleted: true,
    );
    return update(profileTable).replace(deletedProfile);
  }

  Future clearAll() {
    return delete(profileTable).go();
  }

  // Read

  Stream<List<ProfileModel>> watchAll() {
    var query = _getBaseQuery();

    query
      ..where(
        (profile) => profile.deleted.equals(false),
      );

    return _mapQuery(query);
  }

  // Base

  SimpleSelectStatement<$ProfileTableTable, ProfileEntity> _getBaseQuery() {
    return select(profileTable);
  }

  Stream<List<ProfileModel>> _mapQuery(
      SimpleSelectStatement<$ProfileTableTable, ProfileEntity> query) {
    return query.watch().map(
          (rows) => rows
              .map(
                (entity) => ProfileConverter.toModel(entity),
              )
              .toList(),
        );
  }
}
