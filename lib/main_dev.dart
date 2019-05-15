import 'package:flutter/material.dart';
import 'package:my_finance_flutter/app.dart';
import 'package:my_finance_flutter/config/flavor/flavor.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.DEV,
      values: FlavorValues(
          baseUrl:
              "https://raw.githubusercontent.com/JHBitencourt/ready_to_go/master/lib/json/person_qa.json"));

  runApp(App());
}
