import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/model/transaction.dart';
import 'package:my_finance_flutter/core/data_source/db/model/user.dart';

part 'account.g.dart';
part 'account.jorm.dart';

@JsonSerializable()
class Account {
  Account();

  Account.make(this.name);

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

  @HasMany(TransactionBean)
  List<Transaction> transactions;

  @BelongsTo(UserBean, isNullable: false)
  int user;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@GenBean()
class AccountBean extends Bean<Account> with _AccountBean {
  AccountBean(Adapter adapter) : super(adapter);

  final String tableName = 'accounts';

  @override
  TransactionBean get transactionBean => TransactionBean(adapter);

  @override
  UserBean get userBean => UserBean(adapter);
}
