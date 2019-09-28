import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/app.dart';
import 'package:my_finance_flutter/core/config/flavor/flavor.dart';

void main() {
  Flavor(
    flavor: FlavorEnum.DEV,
    values: FlavorValues(
      baseUrlRest: "https://api.github.com",
      baseUrlGraphQL: "https://api.github.com/graphql",
      githubToken: "",
    ),
  );

  runApp(App());
}
