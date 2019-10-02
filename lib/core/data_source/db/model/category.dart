import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/model/transaction.dart';
import 'package:my_finance_flutter/core/data_source/db/model/user.dart';

part 'category.g.dart';
part 'category.jorm.dart';

@JsonSerializable()
class CategoryEntity {
  CategoryEntity();

  CategoryEntity.make(this.name);

  @PrimaryKey(auto: true)
  int id;

  @Column(isNullable: true)
  String remoteId;

  @Column(isNullable: false)
  String name;

  @HasOne(CategoryEntityBean)
  @JsonKey(ignore: true)
  CategoryEntity child;

  @BelongsTo(CategoryEntityBean, isNullable: true)
  int parentId;

  @HasMany(TransactionEntityBean)
  @JsonKey(ignore: true)
  List<TransactionEntity> transactions;

  @BelongsTo(UserEntityBean, isNullable: false)
  int user;

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}

@GenBean()
class CategoryEntityBean extends Bean<CategoryEntity> with _CategoryEntityBean {
  CategoryEntityBean(Adapter adapter) : super(adapter);

  final String tableName = 'categories';

  @override
  CategoryEntityBean get categoryEntityBean => CategoryEntityBean(adapter);

  @override
  TransactionEntityBean get transactionEntityBean =>
      TransactionEntityBean(adapter);

  @override
  UserEntityBean get userEntityBean => UserEntityBean(adapter);
}
