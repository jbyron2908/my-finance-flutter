import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/storage/client/client.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/route.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await StorageClient.instance.init();
      await AppRouter.replaceTo(context, MainRoute());
    });

    return Scaffold(
      body: Center(
        child: Text("MyFinance"),
      ),
    );
  }
}
