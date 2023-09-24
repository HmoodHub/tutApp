import 'package:flutter/material.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/content_state_type.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/empty_state_type.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/error_state_type.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/loading_state_type.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_type.dart';

abstract class FlowState {
  StateRendererTypes get getStateRendererType;

  String get getMessage;
}

extension FlowStateExtension on FlowState {
  Widget getWidgetScreenState(
    BuildContext context, {
    required Widget contentScreenWidget,
    required Function retryActionFun,
  }) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType == StateRendererTypes.popupLoadingState) {
            // Show Dialog
            showPopup(context,
                stateRendererType: getStateRendererType, message: getMessage);
            // Show Content UI in Screen
            return contentScreenWidget;
          } else {
            return StateRenderer(
              rendererTypes: getStateRendererType,
              retryAction: retryActionFun,
              message: getMessage,
            );
          }
        }
      case ErrorState:
        {
          dismissDialog(context);
          if (getStateRendererType == StateRendererTypes.popupErrorState) {
            // Show Dialog
            showPopup(context,
                stateRendererType: getStateRendererType, message: getMessage);
            // Show Content UI in Screen
            return contentScreenWidget;
          } else {
            return StateRenderer(
              rendererTypes: getStateRendererType,
              retryAction: retryActionFun,
              message: getMessage,
            );
          }
        }
      case EmptyState:
        {
          return StateRenderer(
            retryAction: retryActionFun,
            rendererTypes: getStateRendererType,
            message: getMessage,
          );
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  showPopup(BuildContext context,
      {required StateRendererTypes stateRendererType,
      required String message}) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (context) {
          return StateRenderer(
            rendererTypes: stateRendererType,
            message: message,
            retryAction: () {},
          );
        },
      ),
    );
  }

  bool _isCurrentDialog(BuildContext context){
    // to check Is dialog showing or not?
    return ModalRoute.of(context)?.isCurrent != true;
  }
  dismissDialog(BuildContext context){
    if (_isCurrentDialog(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }
}
