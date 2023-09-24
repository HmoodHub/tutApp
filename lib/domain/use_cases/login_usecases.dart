import 'package:dartz/dartz.dart';
import 'package:test_app_mvvm/data/network/handle_failure/failure.dart';
import 'package:test_app_mvvm/data/network/requests.dart';
import 'package:test_app_mvvm/domain/models/models.dart';
import 'package:test_app_mvvm/domain/repositories/repository.dart';
import 'package:test_app_mvvm/domain/use_cases/base_use_cases.dart';

class LoginUseCase
    implements BaseUseCase<LoginUseCaseInput, AuthenticationModel> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, AuthenticationModel>> execute(
      LoginUseCaseInput input) async {
    return _repository.login(
      LoginRequest(
        input.email,
        input.password,
      ),
    );
  }
}

class LoginUseCaseInput {
  String email, password;

  LoginUseCaseInput(this.email, this.password);
}
