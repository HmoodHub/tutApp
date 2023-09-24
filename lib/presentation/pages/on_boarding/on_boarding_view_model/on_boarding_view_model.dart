import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:test_app_mvvm/presentation/base/base_view_model.dart';
import 'package:test_app_mvvm/presentation/pages/on_boarding/on_boarding_view_model/on_boarding_view_model_input.dart';
import 'package:test_app_mvvm/presentation/pages/on_boarding/on_boarding_view_model/on_boarding_view_model_output.dart';
import '../../../../domain/models/models.dart';
import '../../../manager/app_routs.dart';
import '../../../manager/assets_manager.dart';
import '../../../manager/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  final StreamController _streamController =
      StreamController<OnBordingObjectModel>();

  late final List<OnBoardingModel> _list;
  int currentIndex = 0;

  // This is input view
  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  void start() {
    // TODO: implement start
    _list = _oBoardingList();
    _postDataToView();
  }

  @override
  void onPageChanged(int value) {
    // TODO: implement onPageChanged
    currentIndex = value;
    _postDataToView();
  }

  @override
  void pressArrowLeft() {
    // TODO: implement pressArrowLeft
    currentIndex--;
    _postDataToView();

  }

  @override
  void pressArrowRight() {
    // TODO: implement pressArrowRight
    currentIndex++;
    _postDataToView();

  }

  @override
  void pressNext(BuildContext context) {
    // TODO: implement pressNext
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  void pressSkip() {
    // TODO: implement pressSkip
    currentIndex = 3;
    _postDataToView();
  }

  @override
  // TODO: implement onBoardingObjectInput
  Sink get onBoardingObjectInput => _streamController.sink;

  //This is output view
  @override
  // TODO: implement onBoardingObjectOutput
  Stream<OnBordingObjectModel> get onBoardingObjectOutput =>
      _streamController.stream.map((pagView) => pagView);

  List<OnBoardingModel> _oBoardingList() {
    return [
      OnBoardingModel(
          title: AppStringManager.onBoardingTitle1,
          subTitle: AppStringManager.onBoardingSubTitle1,
          image: ImageAssets.onBoarding1),
      OnBoardingModel(
        title: AppStringManager.onBoardingTitle2,
        subTitle: AppStringManager.onBoardingSubTitle2,
        image: ImageAssets.onBoarding2,
      ),
      OnBoardingModel(
        title: AppStringManager.onBoardingTitle3,
        subTitle: AppStringManager.onBoardingSubTitle3,
        image: ImageAssets.onBoarding3,
      ),
      OnBoardingModel(
        title: AppStringManager.onBoardingTitle4,
        subTitle: AppStringManager.onBoardingSubTitle4,
        image: ImageAssets.onBoarding4,
      ),
    ];
  }

  void _postDataToView() {
    onBoardingObjectInput.add(
      OnBordingObjectModel(
        model: _list[currentIndex],
        numOfPageView: _list.length,
        currentIndex: currentIndex,
      ),
    );
  }
}
