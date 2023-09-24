import 'package:dartz/dartz.dart';
import 'package:test_app_mvvm/data/data_sources/remote_data_source.dart';
import 'package:test_app_mvvm/data/mapper/mapper.dart';
import 'package:test_app_mvvm/data/network/handle_failure/api_status.dart';
import 'package:test_app_mvvm/data/network/handle_failure/error_handler.dart';
import 'package:test_app_mvvm/data/network/handle_failure/failure.dart';
import 'package:test_app_mvvm/data/network/handle_failure/failure_handle_extension.dart';
import 'package:test_app_mvvm/data/network/handle_failure/failure_type.dart';
import 'package:test_app_mvvm/data/network/network_conniction_checker.dart';
import 'package:test_app_mvvm/data/network/requests.dart';
import 'package:test_app_mvvm/domain/models/models.dart';
import 'package:test_app_mvvm/domain/repositories/repository.dart';

import '../response/responses.dart';

class RepositoryImplement implements Repository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;

  RepositoryImplement(
    this._networkInfo,
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, AuthenticationModel>> login(
    LoginRequest loginRequest,
  ) async {
    if (await _networkInfo.isConnection) {
      //connection success
      try {
        final AuthResponse responseLogin =
            await _remoteDataSource.login(loginRequest);
        if (responseLogin.status == ApiStatus.SUCCESS) {
          // login success
          return Right(
            responseLogin.toAuthenticationModel(),
          );
        } else {
          // login error (409)
          return Left(
            Failure(
              ApiStatus.FAILURE,
              responseLogin.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandle.handle(error).failure);
      }
    } else {
      //connection error (501)
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
