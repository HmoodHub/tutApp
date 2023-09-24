import 'dart:async';

import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';

import 'base_view_model_output.dart';
import 'base_view_model_input.dart';

abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {
  final StreamController<FlowState> _inputFlowState = StreamController<FlowState>.broadcast();

  @override
  // TODO: implement flowStateInput
  Sink get flowStateInput => _inputFlowState.sink;

  @override
  // TODO: implement flowStateOutput
  Stream<FlowState> get flowStateOutput => _inputFlowState.stream.map((flowState) => flowState);
  @override
  void dispose() {
    // TODO: implement dispose
    _inputFlowState.close();
  }
}



