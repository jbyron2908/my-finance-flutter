import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:my_finance_flutter/ui/app/app_binding.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';

import 'app_binding.dart';

class App extends StatelessWidget {
  final AppRouter appRouter = Get.put(AppRouter());

  @override
  Widget build(BuildContext context) {
    var navigationHandler = NavigationHandler(appRouter.routeList);
    return I18n(
      child: GetMaterialApp(
        navigatorKey: appRouter.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        supportedLocales: [
          const Locale('en', 'US'),
        ],
        initialBinding: AppBinding(),
        initialRoute: '/',
        onGenerateRoute: navigationHandler.routeGenerator,
      ),
    );
  }
}
