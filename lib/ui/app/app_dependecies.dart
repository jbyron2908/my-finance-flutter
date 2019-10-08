import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/provider_setup.dart';
import 'package:provider/provider.dart';

class AppDependencies extends StatelessWidget {
  const AppDependencies({Key key, Widget child})
      : this.child = child,
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GlobalDependencies(
        child: child,
      ),
    );
  }
}

class GlobalDependencies extends StatelessWidget {
  const GlobalDependencies({Key key, Widget child})
      : this.child = child,
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: DataDependencies(
        child: child,
      ),
    );
  }
}

class DataDependencies extends StatelessWidget {
  const DataDependencies({Key key, Widget child})
      : this.child = child,
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: dataProviders(context),
      child: child,
    );
  }
}
