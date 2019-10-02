import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';
import 'package:my_finance_flutter/core/data_source/db/model/category.dart';
import 'package:my_finance_flutter/core/data_source/db/model/transaction.dart';

part 'user.g.dart';
part 'user.jorm.dart';

@JsonSerializable()
class UserEntity {
  UserEntity();

  UserEntity.make(this.name);

  @PrimaryKey(auto: true)
  int id;

  @Column(isNullable: false)
  String name;

  @HasMany(CategoryEntityBean)
  @JsonKey(ignore: true)
  List<CategoryEntity> categories;

  @HasMany(AccountEntityBean)
  @JsonKey(ignore: true)
  List<AccountEntity> accounts;

  @HasMany(TransactionEntityBean)
  @JsonKey(ignore: true)
  List<TransactionEntity> transactions;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

@GenBean()
class UserEntityBean extends Bean<UserEntity> with _UserEntityBean {
  UserEntityBean(Adapter adapter) : super(adapter);

  final String tableName = 'users';

  @override
  CategoryEntityBean get categoryEntityBean => CategoryEntityBean(adapter);

  @override
  AccountEntityBean get accountEntityBean => AccountEntityBean(adapter);

  @override
  TransactionEntityBean get transactionEntityBean =>
      TransactionEntityBean(adapter);
}
