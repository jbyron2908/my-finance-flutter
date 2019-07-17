// The model
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:my_finance_flutter/data_source/db/model/transaction.dart';

part 'category.jorm.dart';

class Category {
  Category();

  Category.make(this.name);

  @PrimaryKey(auto: true)
  int id;

  @Column(isNullable: true)
  String remoteId;

  @Column(isNullable: false)
  String name;

  @HasOne(CategoryBean)
  Category child;

  @BelongsTo(CategoryBean, isNullable: true)
  int parentId;

  @HasMany(TransactionBean)
  List<Transaction> transactions;
}

@GenBean()
class CategoryBean extends Bean<Category> with _CategoryBean {
  CategoryBean(Adapter adapter) : super(adapter);

  final String tableName = 'category';

  @override
  CategoryBean get categoryBean => CategoryBean(adapter);

  @override
  TransactionBean get transactionBean => TransactionBean(adapter);
}
