import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';
import 'package:my_finance_flutter/core/data_source/db/model/category.dart';
import 'package:my_finance_flutter/core/data_source/db/model/user.dart';

part 'transaction.g.dart';
part 'transaction.jorm.dart';

@JsonSerializable()
class Transaction {
  Transaction();

  Transaction.make(this.title, this.value, this.date);

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

  @BelongsTo(CategoryBean, isNullable: false)
  int category;

  @BelongsTo(AccountBean, isNullable: false)
  int account;

  @BelongsTo(UserBean, isNullable: false)
  int user;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

@GenBean()
class TransactionBean extends Bean<Transaction> with _TransactionBean {
  TransactionBean(Adapter adapter) : super(adapter);

  final String tableName = 'transactions';

  @override
  AccountBean get accountBean => AccountBean(adapter);

  @override
  CategoryBean get categoryBean => CategoryBean(adapter);

  @override
  UserBean get userBean => UserBean(adapter);
}
