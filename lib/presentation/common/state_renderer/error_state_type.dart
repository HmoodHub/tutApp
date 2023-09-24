import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_type.dart';

class ErrorState implements FlowState{
  String message;
  StateRendererTypes stateRendererType;

  ErrorState({required this.message, required this.stateRendererType});

  /// here I use stateRenderer type because we have tow type in error.
  /// types (POPUP, FULL SCREEN).

  @override
  // TODO: implement getMessage
  String get getMessage => message;

  @override
  // TODO: implement getStateRendererType
  StateRendererTypes get getStateRendererType => stateRendererType;
}