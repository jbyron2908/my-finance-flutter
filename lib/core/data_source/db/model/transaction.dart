import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';
import 'package:my_finance_flutter/core/data_source/db/model/category.dart';
import 'package:my_finance_flutter/core/data_source/db/model/user.dart';

part 'transaction.g.dart';
part 'transaction.jorm.dart';

@JsonSerializable()
class TransactionEntity {
  TransactionEntity();

  TransactionEntity.make(this.title, this.value, this.date);

  @PrimaryKey(auto: true)
  int id;

  @Column(isNullable: true)
  String remoteId;

  @Column(isNullable: false)
  String title;

  @Column(isNullable: false)
  double value;

  @Column(isNullable: false)
  String operation = "Add";

  @Column(isNullable: false)
  String date;

  @Column(isNullable: false)
  String state = "Paid";

  @Column(isNullable: true)
  String description;

  @BelongsTo(CategoryEntityBean, isNullable: false)
  int category;

  @BelongsTo(AccountEntityBean, isNullable: false)
  int account;

  @BelongsTo(UserEntityBean, isNullable: false)
  int user;

  factory TransactionEntity.fromJson(Map<String, dynamic> json) =>
      _$TransactionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionEntityToJson(this);
}

@GenBean()
class TransactionEntityBean extends Bean<TransactionEntity>
    with _TransactionEntityBean {
  TransactionEntityBean(Adapter adapter) : super(adapter);

  final String tableName = 'transactions';

  @override
  AccountEntityBean get accountEntityBean => AccountEntityBean(adapter);

  @override
  CategoryEntityBean get categoryEntityBean => CategoryEntityBean(adapter);

  @override
  UserEntityBean get userEntityBean => UserEntityBean(adapter);
}
