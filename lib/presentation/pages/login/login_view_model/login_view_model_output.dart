mixin LoginViewModelOutput {
  Stream<bool> get usernameValidOutput;

  Stream<bool> get passwordValidOutput;

  Stream<bool> get areAllInputValidOutput;
}
