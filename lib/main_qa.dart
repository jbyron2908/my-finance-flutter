import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/flavor/flavor.dart';
import 'package:my_finance_flutter/ui/app/app.dart';

void main() {
  Flavor(
    flavor: FlavorEnum.QA,
    color: Colors.deepPurpleAccent,
    values: FlavorValues(
      baseUrlRest: "https://api.github.com",
      baseUrlGraphQL: "https://api.github.com/graphql",
      githubToken: "eaf44d83e792390d0ae70644052b71867e1591a5",
    ),
  );

  runApp(App());
}
