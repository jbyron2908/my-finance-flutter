import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/model/transaction.dart';
import 'package:my_finance_flutter/core/data_source/db/model/user.dart';

part 'account.g.dart';
part 'account.jorm.dart';

@JsonSerializable()
class AccountEntity {
  AccountEntity();

  AccountEntity.make(this.name);

  @PrimaryKey(auto: true)
  int id;

  @Column(isNullable: true)
  String remoteId;

  @Column(isNullable: false)
  String name;

  @Column(isNullable: false)
  String type = "Bank";

  @Column(isNullable: false)
  double initialValue = 0;

  @Column(isNullable: false)
  String currency = "\$";

  @HasMany(TransactionEntityBean)
  @JsonKey(ignore: true)
  List<TransactionEntity> transactions;

  @BelongsTo(UserEntityBean, isNullable: false)
  int user;

  factory AccountEntity.fromJson(Map<String, dynamic> json) =>
      _$AccountEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AccountEntityToJson(this);
}

@GenBean()
class AccountEntityBean extends Bean<AccountEntity> with _AccountEntityBean {
  AccountEntityBean(Adapter adapter) : super(adapter);

  final String tableName = 'accounts';

  @override
  TransactionEntityBean get transactionEntityBean =>
      TransactionEntityBean(adapter);

  @override
  UserEntityBean get userEntityBean => UserEntityBean(adapter);
}
