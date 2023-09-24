import 'dart:async';

import 'package:test_app_mvvm/domain/use_cases/login_usecases.dart';
import 'package:test_app_mvvm/presentation/base/base_view_model.dart';
import 'package:test_app_mvvm/presentation/common/login_freezed/login_freezed.dart';
import 'package:test_app_mvvm/presentation/pages/login/login_view_model/login_view_model_input.dart';
import 'package:test_app_mvvm/presentation/pages/login/login_view_model/login_view_model_output.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
  final StreamController _usernameStream = StreamController<String>.broadcast();
  final StreamController _passwordStream = StreamController<String>.broadcast();
  final StreamController _areAllInputValid = StreamController<void>.broadcast();

  var loginObject = const LoginObject("", "");
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);
  // LoginViewModel();

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameStream.close();
    _passwordStream.close();
    _areAllInputValid.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  /// Input
  @override
  login() async {
    (await _loginUseCase.execute(
      LoginUseCaseInput(
        loginObject.email,
        loginObject.password,
      ),
    ))
        .fold(
      (failure) {
        print(failure.message);
      },
      (authData) {
        print(authData.customerOb?.name);
      },
    );
  }

  @override
   setUsername(String username) {
    usernameInput.add(username);
    loginObject = loginObject.copyWith(email: username);
    areAllInputValidInput.add(null);
  }

  @override
   setPassword(String password) {
    passwordInput.add(password);
    loginObject = loginObject.copyWith(password: password);
    areAllInputValidInput.add(null);
  }

  @override
  // TODO: implement usernameInput
  Sink get usernameInput => _usernameStream.sink;

  @override
  Sink get passwordInput => _passwordStream.sink;

  /// Output
  @override
  // TODO: implement passwordValidOutput
  Stream<bool> get passwordValidOutput => _passwordStream.stream.map(
        (password) => _validationPassword(password),
      );

  @override
  // TODO: implement usernameValidOutput
  Stream<bool> get usernameValidOutput => _usernameStream.stream.map(
        (username) => _validationUsername(username),
      );

  bool _validationPassword(String password) {
    return password.isNotEmpty;
  }

  bool _validationUsername(String username) {
    return username.isNotEmpty;
  }

  @override
  // TODO: implement areAllInputValidInput
  Sink get areAllInputValidInput => _areAllInputValid.sink;

  @override
  // TODO: implement areAllInputValidOutput
  Stream<bool> get areAllInputValidOutput => _areAllInputValid.stream.map((_) => _areAllInputValidFN());

  bool _areAllInputValidFN(){
    return _validationPassword(loginObject.password) && _validationUsername(loginObject.email);
  }
}
