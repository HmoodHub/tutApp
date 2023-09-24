abstract class BaseViewModelInput {
  void start();

  void dispose();

  Sink get flowStateInput;
}
