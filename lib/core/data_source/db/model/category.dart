import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/model/transaction.dart';
import 'package:my_finance_flutter/core/data_source/db/model/user.dart';

part 'category.g.dart';
part 'category.jorm.dart';

@JsonSerializable()
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

  @BelongsTo(UserBean, isNullable: false)
  int user;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@GenBean()
class CategoryBean extends Bean<Category> with _CategoryBean {
  CategoryBean(Adapter adapter) : super(adapter);

  final String tableName = 'categories';

  @override
  CategoryBean get categoryBean => CategoryBean(adapter);

  @override
  TransactionBean get transactionBean => TransactionBean(adapter);

  @override
  UserBean get userBean => UserBean(adapter);
}
