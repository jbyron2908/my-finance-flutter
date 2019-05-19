import 'package:flutter/material.dart';
import 'package:my_finance_flutter/app.dart';
import 'package:my_finance_flutter/config/flavor/flavor.dart';

void main() {
  Flavor(
      flavor: FlavorEnum.QA,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(
          baseUrlRest: "https://api.github.com",
          baseUrlGraphQL: "https://api.github.com/graphql",
          githubToken: ""));

  runApp(App());
}
