import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/screen/splash/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/splash/widget/view.dart';

class SplashScreen extends BaseScreen<SplashBloc> {
  @override
  Widget build(BuildContext context) {
    return SplashView();
  }

  @override
  SplashBloc buildBloc(BuildContext context) {
    return SplashBloc();
  }
}
