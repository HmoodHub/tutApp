import 'package:test_app_mvvm/app/constants.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_type.dart';

class ContentState implements FlowState{
  /// here no parameter because this state in one renderer type its FULL SCREEN.
  @override
  // TODO: implement getMessage
  String get getMessage => Constants.empty;

  @override
  // TODO: implement getStateRendererType
  StateRendererTypes get getStateRendererType => StateRendererTypes.contentState;

  ContentState();
}