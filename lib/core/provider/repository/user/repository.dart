import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class UserRepository {
  static SingleChildWidget buildProvider() =>
      Provider.value(value: UserRepository());

  static UserRepository of(BuildContext context) =>
      Provider.of<UserRepository>(context, listen: false);

  UserRepository();
}
