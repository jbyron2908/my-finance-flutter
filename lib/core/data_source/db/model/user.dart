import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';
import 'package:my_finance_flutter/core/data_source/db/model/category.dart';
import 'package:my_finance_flutter/core/data_source/db/model/transaction.dart';

part 'user.g.dart';
part 'user.jorm.dart';

@JsonSerializable()
class User {
  User();

  User.make(this.name);

  @PrimaryKey(auto: true)
  int id;

  @Column(isNullable: false)
  String name;

  @HasMany(CategoryBean)
  List<Category> categories;

  @HasMany(AccountBean)
  List<Account> accounts;

  @HasMany(TransactionBean)
  List<Transaction> transactions;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@GenBean()
class UserBean extends Bean<User> with _UserBean {
  UserBean(Adapter adapter) : super(adapter);

  final String tableName = 'users';

  @override
  CategoryBean get categoryBean => CategoryBean(adapter);

  @override
  AccountBean get accountBean => AccountBean(adapter);

  @override
  TransactionBean get transactionBean => TransactionBean(adapter);
}
