import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app_mvvm/presentation/manager/app_routs.dart';
import 'package:test_app_mvvm/presentation/manager/assets_manager.dart';
import 'package:test_app_mvvm/presentation/manager/color_manager.dart';
import 'package:test_app_mvvm/presentation/manager/constants_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: AppConstant.splashDelay), (){
      Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorManager.primary,
      body: Center(
        child: Image.asset(ImageAssets.splashLogo),
      ),
    );
  }
}
