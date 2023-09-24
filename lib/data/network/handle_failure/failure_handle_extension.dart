import 'package:test_app_mvvm/data/network/handle_failure/failure.dart';

import 'error_handler.dart';

extension FailureHandelExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(
          ResponseCode.SUCCESS,
          ResponseMessage.SUCCESS,
        );
      case DataSource.NO_CONTENT:
        return Failure(
          ResponseCode.NO_CONTENT,
          ResponseMessage.NO_CONTENT,
        );
      case DataSource.BAD_REQUEST:
        return Failure(
          ResponseCode.BAD_REQUEST,
          ResponseMessage.BAD_REQUEST,
        );
      case DataSource.FORBIDDEN:
        return Failure(
          ResponseCode.FORBIDDEN,
          ResponseMessage.FORBIDDEN,
        );
      case DataSource.UNAUTORISED:
        return Failure(
          ResponseCode.UNAUTORISED,
          ResponseMessage.UNAUTORISED,
        );
      case DataSource.NOT_FOUND:
        return Failure(
          ResponseCode.NOT_FOUND,
          ResponseMessage.NOT_FOUND,
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
          ResponseCode.INTERNAL_SERVER_ERROR,
          ResponseMessage.INTERNAL_SERVER_ERROR,
        );
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
          ResponseCode.CONNECT_TIMEOUT,
          ResponseMessage.CONNECT_TIMEOUT,
        );
      case DataSource.CANCEL:
        return Failure(
          ResponseCode.CANCEL,
          ResponseMessage.CANCEL,
        );
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
          ResponseCode.RECEIVE_TIMEOUT,
          ResponseMessage.RECEIVE_TIMEOUT,
        );
      case DataSource.SEND_TIMEOUT:
        return Failure(
          ResponseCode.SEND_TIMEOUT,
          ResponseMessage.SEND_TIMEOUT,
        );
      case DataSource.CACHE_ERROR:
        return Failure(
          ResponseCode.CACHE_ERROR,
          ResponseMessage.CACHE_ERROR,
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.NO_INTERNET_CONNECTION,
        );
      case DataSource.DEFAULT:
        return Failure(
          ResponseCode.DEFAULT,
          ResponseMessage.DEFAULT,
        );
    }
  }
}
