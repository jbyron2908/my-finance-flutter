import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/model/user.dart';

part 'user.g.dart';

@UseDao(tables: [UserTable])
class UserDao extends DatabaseAccessor<DatabaseClient> with _$UserDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  UserDao(DatabaseClient db) : super(db);

  Future<int> insert(UserEntity userEntity) {
    return into(userTable).insert(userEntity);
  }

  Future<List<UserEntity>> getAll() {
    return select(userTable).get();
  }
}
