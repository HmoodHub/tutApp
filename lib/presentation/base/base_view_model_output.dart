import 'package:test_app_mvvm/presentation/common/state_renderer/state_renderer_impl.dart';

mixin BaseViewModelOutput {
  Stream<FlowState> get flowStateOutput;
}