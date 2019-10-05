import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserRepository {
  static UserRepository of(BuildContext context) =>
      Provider.of<UserRepository>(context);

  UserRepository();
}
