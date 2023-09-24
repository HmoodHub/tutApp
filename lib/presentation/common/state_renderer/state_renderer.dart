// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_type.dart';
import 'package:test_app_mvvm/presentation/manager/assets_manager.dart';
import 'package:test_app_mvvm/presentation/manager/color_manager.dart';
import 'package:test_app_mvvm/presentation/manager/font_manager.dart';
import 'package:test_app_mvvm/presentation/manager/strings_manager.dart';
import 'package:test_app_mvvm/presentation/manager/style_manager.dart';
import 'package:test_app_mvvm/presentation/manager/values_manager.dart';
import 'package:test_app_mvvm/presentation/widgets/app_widget.dart';

class StateRenderer extends StatelessWidget {
  StateRendererTypes rendererTypes;
  String message, title;
  Function retryAction;

  StateRenderer({
    super.key,
    required this.rendererTypes,
    this.message = AppStringManager.loading,
    this.title = "",
    required this.retryAction,
  });

  @override
  Widget build(BuildContext context) {
    return _getWidgetState(context);
  }

  Widget _getWidgetState(BuildContext context) {
    switch (rendererTypes) {
      case StateRendererTypes.popupLoadingState:
        return _getDialog(
          [
            _getAnimatedImage(JsonAssets.loading),
          ],
        );
      case StateRendererTypes.popupErrorState:
        return _getDialog(
          [
            _getAnimatedImage(JsonAssets.error),
            _getTextMessage(message),
            _getButtonState(
              context,
              label: AppStringManager.ok,
            ),
          ],
        );
      case StateRendererTypes.fullScreenLoadingState:
        return _baseWidgetState(
          [
            _getAnimatedImage(JsonAssets.loading),
            _getTextMessage(message),
          ],
        );
      case StateRendererTypes.fullScreenErrorState:
        return _baseWidgetState(
          [
            _getAnimatedImage(JsonAssets.error),
            _getTextMessage(message),
            _getButtonState(context, label: AppStringManager.retryAgain),
          ],
        );
      case StateRendererTypes.fullScreenEmptyState:
        return _baseWidgetState(
          [
            _getAnimatedImage(JsonAssets.empty),
            _getTextMessage(message),
          ],
        );
      case StateRendererTypes.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _baseWidgetState(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getDialog(List<Widget> children) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: AppSize.s1_5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s14),
          color: AppColorManager.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
            ),
          ],
          shape: BoxShape.rectangle,
        ),
        child: _getDialogStateContent(children),
      ),
    );
  }

  Widget _getDialogStateContent(List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String jsonAnimate) {
    return SizedBox(
      height: AppSize.s100,
      width: double.infinity,
      child: Lottie.asset(jsonAnimate),
    );
  }

  Widget _getTextMessage(String message) {
    return Text(
      message,
      style: getRegularStyle(
        color: AppColorManager.black,
        size: AppFontSizeManager.s18,
      ),
    );
  }

  Widget _getButtonState(BuildContext context, {required String label}) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s18),
      child: MyButton(
        child: Text(label),
        onPress: () {
          if (rendererTypes == StateRendererTypes.fullScreenErrorState) {
            retryAction.call();
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
