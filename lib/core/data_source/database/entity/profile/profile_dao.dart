import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/model/profile/profile_converter.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';

part 'profile_dao.g.dart';

@UseDao(tables: [ProfileTable])
class ProfileDao extends BaseDao<ProfileEntity, ProfileModel>
    with _$ProfileDaoMixin {
  ProfileDao(DatabaseClient database) : super(database);

  @override
  Table get table => profileTable;

  // Write

  Future markDelete(ProfileEntity entity) {
    var deletedProfile = entity.copyWith(
      deleted: true,
    );
    return update(profileTable).replace(deletedProfile);
  }

  // Read

  Stream<List<ProfileModel>> watchAll() {
    var query = getBaseQuery();

    query
      ..where(
        profileTable.deleted.equals(false),
      );

    return mapQuery(query);
  }

  // Base

  @override
  JoinedSelectStatement getBaseQuery() {
    return select(profileTable).join([]);
  }

  @override
  Stream<List<ProfileModel>> mapQuery(
    JoinedSelectStatement query,
  ) {
    return query.watch().map(
          (rows) => rows
              .map(
                (resultRow) => ProfileConverter.toModel(
                  resultRow.readTable(profileTable),
                ),
              )
              .toList(),
        );
  }
}
