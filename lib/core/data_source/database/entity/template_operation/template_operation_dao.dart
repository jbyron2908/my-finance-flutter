import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/template_operation/template_operation_table.dart';
import 'package:my_finance_flutter/core/model/template_operation/template_operation_converter.dart';
import 'package:my_finance_flutter/core/model/template_operation/template_operation_model.dart';

part 'template_operation_dao.g.dart';

@UseDao(tables: [
  TemplateOperationTable,
  PayeeTable,
  CategoryTable,
])
class TemplateOperationDao
    extends BaseDao<TemplateOperationEntity, TemplateOperationModel>
    with _$TemplateOperationDaoMixin {
  TemplateOperationDao(DatabaseClient db) : super(db);

  @override
  Table get table => templateOperationTable;

  // Write

  Future markDelete(TemplateOperationEntity entity) {
    var deletedProfile = entity.copyWith(
      deleted: true,
    );
    return update(templateOperationTable).replace(deletedProfile);
  }

  // Read

  Stream<List<TemplateOperationModel>> watchAll() {
    var query = getBaseQuery();

    query
      ..where(
        templateOperationTable.deleted.equals(false),
      );

    return mapQuery(query);
  }

  // Base

  $CategoryTableTable get parentCategoryAlias => alias(categoryTable, 'parent');

  @override
  JoinedSelectStatement getBaseQuery() {
    return select(templateOperationTable).join(
      [
        leftOuterJoin(
          payeeTable,
          payeeTable.id.equalsExp(templateOperationTable.payee),
        ),
        leftOuterJoin(
          categoryTable,
          categoryTable.id.equalsExp(
            templateOperationTable.category,
          ),
        ),
        leftOuterJoin(
          parentCategoryAlias,
          parentCategoryAlias.id.equalsExp(categoryTable.parent),
        ),
      ],
    );
  }

  @override
  Stream<List<TemplateOperationModel>> mapQuery(JoinedSelectStatement query) {
    return query.watch().map((rows) {
      return rows.map(
        (resultRow) {
          return TemplateOperationConverter.toModel(
            resultRow.readTable(templateOperationTable),
            payee: resultRow.readTable(payeeTable),
            category: resultRow.readTable(categoryTable),
            parentCategory: resultRow.readTable(parentCategoryAlias),
          );
        },
      ).toList();
    });
  }
}
