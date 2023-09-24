// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_mvvm/presentation/manager/color_manager.dart';
import 'package:test_app_mvvm/presentation/manager/strings_manager.dart';
import 'package:test_app_mvvm/presentation/manager/values_manager.dart';
import 'package:test_app_mvvm/presentation/pages/on_boarding/on_boarding_view/page_view_item.dart';
import 'package:test_app_mvvm/presentation/pages/on_boarding/on_boarding_view_model/on_boarding_view_model.dart';

import '../../../../domain/models/models.dart';
import 'build_page_view_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();


  @override
  void initState() {
    // TODO: implement initState
    _onBoardingViewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _onBoardingViewModel.onBoardingObjectOutput,
      builder: (context, snapshot) {
        return _onBordingWidget(snapshot.data);
      },
    );
  }

  Widget _onBordingWidget(OnBordingObjectModel? data) {
    if (data == null) {
      return Container();
    }  else{
    return Scaffold(
      backgroundColor: AppColorManager.white,
      appBar: AppBar(
        backgroundColor: AppColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: data.numOfPageView,
              onPageChanged: (value) {
                _onBoardingViewModel.onPageChanged(value);
              },
              itemBuilder: (context, index) => PageViewItem(
                onBoardingItem: data.model,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ConditionalBuilder(
                condition: data.currentIndex == 3,
                builder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                  child: InkWell(
                      onTap: () {
                       _onBoardingViewModel.pressNext(context);
                      },
                      child: Text(
                        AppStringManager.nextButton,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: AppColorManager.primary),
                      )),
                ),
                fallback: (context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                  child: InkWell(
                      onTap: () {
                         _onBoardingViewModel.pressSkip();
                      },
                      child: Text(
                        AppStringManager.skipButton,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: AppColorManager.primary),
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                color: AppColorManager.primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConditionalBuilder(
                      condition: data.currentIndex != 0,
                      builder: (context) => IconButton(
                        onPressed: () {
                            _onBoardingViewModel.pressArrowLeft();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColorManager.white,
                        ),
                      ),
                      fallback: (context) => Container(),
                    ),
                    BuildPageViewIndicator(currentIndex: data.currentIndex, numOfPages: data.numOfPageView),
                    ConditionalBuilder(
                      condition: data.currentIndex != 3,
                      builder: (context) => IconButton(
                        onPressed: () {
                          _onBoardingViewModel.pressArrowRight();
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColorManager.white,
                        ),
                      ),
                      fallback: (context) => Container(),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _onBoardingViewModel.dispose();
    super.dispose();
  }
}
