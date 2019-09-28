// The model
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:my_finance_flutter/core/data_source/db/model/transaction.dart';

part 'account.jorm.dart';

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
}

@GenBean()
class AccountBean extends Bean<Account> with _AccountBean {
  AccountBean(Adapter adapter) : super(adapter);

  final String tableName = 'account';

  @override
  TransactionBean get transactionBean => TransactionBean(adapter);
}
