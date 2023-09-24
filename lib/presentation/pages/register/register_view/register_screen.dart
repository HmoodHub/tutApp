import 'package:flutter/material.dart';
import 'package:test_app_mvvm/presentation/pages/register/register_view_model/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterViewModel _registerViewModel = RegisterViewModel();
  @override
  void initState() {
    // TODO: implement initState
    _registerViewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _registerViewModel.dispose();
    super.dispose();
  }
}
