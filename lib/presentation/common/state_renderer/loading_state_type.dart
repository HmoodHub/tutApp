import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_type.dart';
import 'package:test_app_mvvm/presentation/manager/strings_manager.dart';

class LoadingState implements FlowState{
  String message;
  StateRendererTypes stateRendererType;

  /// here I use stateRenderer type because we have tow type in loading.
  /// types (POPUP, FULL SCREEN).
  LoadingState({this.message = AppStringManager.loading, required this.stateRendererType});

  @override
  // TODO: implement message
  String get getMessage => message;

  @override
  // TODO: implement stateRendererTypes
  StateRendererTypes get getStateRendererType => stateRendererType;
}