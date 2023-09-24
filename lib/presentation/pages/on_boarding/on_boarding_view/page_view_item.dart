// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../domain/models/models.dart';

class PageViewItem extends StatelessWidget {
  PageViewItem({super.key, required this.onBoardingItem});

  OnBoardingModel onBoardingItem;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          onBoardingItem.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: Text(
            onBoardingItem.subTitle,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SvgPicture.asset(onBoardingItem.image),
      ],
    );
  }
}