import 'package:flutter/material.dart';
import 'package:test_app_mvvm/app/dependency_injection.dart';
import 'package:test_app_mvvm/app/my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initAppModule();
  runApp(MyApp());
}