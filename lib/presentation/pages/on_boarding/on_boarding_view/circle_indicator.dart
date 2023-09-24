// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_app_mvvm/presentation/manager/color_manager.dart';

class CircleIndicator extends StatelessWidget {
  CircleIndicator({super.key, required this.isSelected});

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: isSelected ? 10 : 8,
      height: isSelected ? 10 : 8,
      decoration: BoxDecoration(
        color: isSelected ? AppColorManager.primary : AppColorManager.white,
        border: const Border.fromBorderSide(
          BorderSide(
            width: 1,
            color: AppColorManager.white,
          ),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
