import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/account_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/operation/operation_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/model/operation/operation_converter.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';

part 'operation_dao.g.dart';

@UseDao(tables: [
  OperationTable,
  PayeeTable,
  CategoryTable,
  AccountTable,
  ProfileTable,
])
class OperationDao extends BaseDao<OperationEntity, OperationModel>
    with _$OperationDaoMixin {
  OperationDao(DatabaseClient database) : super(database);

  @override
  Table get table => operationTable;

  // Write

  Future markDelete(OperationEntity entity) {
    var deletedOperation = entity.copyWith(
      deleted: true,
    );
    return update(operationTable).replace(deletedOperation);
  }

  // Read

  Stream<List<OperationModel>> watchAll() {
    final query = getBaseQuery();

    query
      ..where(
        operationTable.deleted.equals(false),
      );

    return mapQuery(query);
  }

  Stream<List<OperationModel>> watchFilter(int accountId) {
    final query = getBaseQuery();

    query
      ..where(
        accountTable.id.equals(accountId) &
            operationTable.deleted.equals(false),
      );

    return mapQuery(query);
  }

  // Base

  $CategoryTableTable get parentCategoryAlias => alias(categoryTable, 'parent');

  @override
  JoinedSelectStatement getBaseQuery() {
    return select(operationTable).join(
      [
        leftOuterJoin(
          payeeTable,
          payeeTable.id.equalsExp(operationTable.payee),
        ),
        leftOuterJoin(
          categoryTable,
          categoryTable.id.equalsExp(
            operationTable.category,
          ),
        ),
        leftOuterJoin(
          accountTable,
          accountTable.id.equalsExp(operationTable.account),
        ),
        leftOuterJoin(
          parentCategoryAlias,
          parentCategoryAlias.id.equalsExp(categoryTable.parent),
        ),
        leftOuterJoin(
          profileTable,
          profileTable.id.equalsExp(operationTable.profile),
        ),
      ],
    );
  }

  @override
  Stream<List<OperationModel>> mapQuery(JoinedSelectStatement query) {
    return query.watch().map((rows) {
      return rows.map(
        (resultRow) {
          return OperationConverter.toModel(
            resultRow.readTable(operationTable),
            payee: resultRow.readTable(payeeTable),
            category: resultRow.readTable(categoryTable),
            parentCategory: resultRow.readTable(parentCategoryAlias),
            account: resultRow.readTable(accountTable),
            profile: resultRow.readTable(profileTable),
          );
        },
      ).toList();
    });
  }
}
