import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/splash/bloc/splash_bloc.dart';
import 'package:my_finance_flutter/ui/screen/splash/widget/splash_view.dart';

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