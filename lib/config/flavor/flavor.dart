import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_finance_flutter/util/strings_util.dart';

enum FlavorEnum { DEV, QA, PRODUCTION }

class FlavorValues {
  FlavorValues(
      {@required this.baseUrlRest,
      @required this.baseUrlGraphQL,
      @required this.githubToken});

  final String baseUrlRest;
  final String baseUrlGraphQL;
  final String githubToken;
}

class Flavor {
  final FlavorEnum flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static Flavor _instance;

  factory Flavor(
      {@required FlavorEnum flavor,
      Color color: Colors.blue,
      @required FlavorValues values}) {
    _instance ??= Flavor._internal(
        flavor, StringsUtil.enumName(flavor.toString()), color, values);

    return _instance;
  }

  Flavor._internal(this.flavor, this.name, this.color, this.values);

  static Flavor get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == FlavorEnum.PRODUCTION;

  static bool isDevelopment() => _instance.flavor == FlavorEnum.DEV;

  static bool isQA() => _instance.flavor == FlavorEnum.QA;
}
