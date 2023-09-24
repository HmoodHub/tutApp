mixin LoginViewModelInput {
  setUsername(String username);

  setPassword(String password);

  login();

  Sink get usernameInput;

  Sink get passwordInput;

  Sink get areAllInputValidInput;
}
