import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_type.dart';

class EmptyState implements FlowState{
  String message;
  /// here no parameter because this state in one renderer type its FULL SCREEN.
  EmptyState({required this.message});

  @override
  // TODO: implement getMessage
  String get getMessage => message;

  @override
  // TODO: implement getStateRendererType
  StateRendererTypes get getStateRendererType => StateRendererTypes.fullScreenEmptyState;
}