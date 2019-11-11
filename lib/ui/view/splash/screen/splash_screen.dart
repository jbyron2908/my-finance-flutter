import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/splash/screen/splash_bloc.dart';
import 'package:my_finance_flutter/ui/view/splash/widget/splash_view.dart';

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
