// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


import 'circle_indicator.dart';


class BuildPageViewIndicator extends StatelessWidget {
  BuildPageViewIndicator(
      {super.key, required this.numOfPages, required this.currentIndex,});


  int numOfPages;
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        numOfPages,
        (index) => CircleIndicator(isSelected: index == currentIndex),
      ),
    );
  }
}
