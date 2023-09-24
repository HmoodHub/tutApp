// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_app_mvvm/presentation/manager/values_manager.dart';

import '../manager/color_manager.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField(
      {super.key,
      required this.controller,
      required this.hint,
      // required this.label,
      required this.error});

  TextEditingController controller;
  String hint;

  // Widget label;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        style: const TextStyle(color: AppColorManager.black),
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColorManager.lightGray,
            ),
          ),
          hintText: hint,
          // label: label,
          errorText: error,
          contentPadding: EdgeInsets.symmetric(horizontal: AppSize.s10),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton(
      {super.key,
      required this.child,
      required this.onPress,
      this.width = double.infinity,
      this.height = AppSize.s40});

  void Function()? onPress;
  Widget child;

  double width;

  double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height),
        ),
        child: child,
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  MyTextButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPress,
  });

  void Function()? onPress;
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        foregroundColor: color,
      ),
      child: Text(text),
    );
  }
}
