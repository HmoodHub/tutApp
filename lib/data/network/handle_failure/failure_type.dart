import 'package:dio/dio.dart';
import 'package:test_app_mvvm/data/network/handle_failure/failure_handle_extension.dart';

import 'error_handler.dart';
import 'failure.dart';

class ErrorHandle implements Exception {
  late Failure failure;

  ErrorHandle.handle(error) {
    if (error is DioException) {
      //dio error so its an error from response of the API or dio itself
      failure = _handleError(error);
    } else {
      //default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}


Failure _handleError(DioException error){
  switch(error.type){
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      return DataSource.BAD_REQUEST.getFailure();
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.CACHE_ERROR.getFailure();
    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();
  }
  }