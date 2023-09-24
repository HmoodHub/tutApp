import 'package:dartz/dartz.dart';
import 'package:test_app_mvvm/data/network/requests.dart';


import '../../data/network/handle_failure/failure.dart';
import '../models/models.dart';

abstract class Repository {
  Future<Either<Failure, AuthenticationModel>> login(LoginRequest loginRequest);
}
