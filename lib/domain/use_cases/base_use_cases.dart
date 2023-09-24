import 'package:dartz/dartz.dart';
import 'package:test_app_mvvm/data/network/handle_failure/failure.dart';
abstract class BaseUseCase<In, Out>{
  Future<Either<Failure, Out>> execute(In input);
}