import 'package:flutter/material.dart';

mixin OnBoardingViewModelInput {
  void onPageChanged(int value);

  void pressArrowLeft();

  void pressArrowRight();

  void pressSkip();

  void pressNext(BuildContext context);

  Sink get onBoardingObjectInput;
}
