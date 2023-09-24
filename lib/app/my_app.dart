// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test_app_mvvm/presentation/manager/app_routs.dart';
import 'package:test_app_mvvm/presentation/manager/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._();  //named constructor

  static const MyApp _instance = MyApp._(); //create instance from class

  factory MyApp() => _instance; // factory class (مصنع الكلاس)

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      onGenerateRoute: AppRoutes.getRoute,
      initialRoute: AppRoutes.splash,
    );
  }
}
