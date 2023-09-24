// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:test_app_mvvm/data/network/handle_failure/failure.dart';
import 'package:test_app_mvvm/data/network/handle_failure/failure_handle_extension.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ResponseCode {
  static const SUCCESS = 200; //SUCCESS WITH DATA.
  static const NO_CONTENT = 201; //SUCCESS WITH EMPTY DATA
  static const BAD_REQUEST = 400; //ERROR, API REJECTED REQUEST
  static const UNAUTORISED = 401; //ERROR, USER NOT AUTHORIZED
  static const FORBIDDEN = 403; //ERROR, API REJECTED REQUEST
  static const INTERNAL_SERVER_ERROR = 500; //ERROR, CRASH IN SERVER SIDE
  static const NOT_FOUND = 404; //ERROR, NOT FOUND


  //LOCAL STATUS CODE
  static const CONNECT_TIMEOUT = -1;
  static const CANCEL = -2;
  static const RECEIVE_TIMEOUT = -3;
  static const SEND_TIMEOUT = -4;
  static const CACHE_ERROR = -5;
  static const NO_INTERNET_CONNECTION = -6;
  static const DEFAULT = -7;
}

class ResponseMessage {
  static const SUCCESS = "Success."; //SUCCESS WITH DATA.
  static const NO_CONTENT = "Success."; //SUCCESS WITH EMPTY DATA.
  static const BAD_REQUEST =
      "Bad request, Try again later."; //ERROR, API REJECTED REQUEST.
  static const UNAUTORISED =
      "User is unauthorized, Try again later."; //ERROR, USER NOT AUTHORIZED.
  static const FORBIDDEN =
      "Forbidden request, Try again later."; //ERROR, API REJECTED REQUEST.
  static const INTERNAL_SERVER_ERROR =
      "Something went error, Try again later."; //ERROR, CRASH IN SERVER SIDE.
  static const NOT_FOUND =
      "Something went error, Try again later."; //ERROR, NOT FOUND.

  //LOCAL STATUS CODE
  static const CONNECT_TIMEOUT = "Time out error, Try again later.";
  static const CANCEL = "Request was cancelled, Try again later.";
  static const RECEIVE_TIMEOUT = "Time out error, Try again later.";
  static const SEND_TIMEOUT = "Time out error, Try again later.";
  static const CACHE_ERROR = "Cache error, Try again later.";
  static const NO_INTERNET_CONNECTION =
      "Please check your internet connection.";
  static const DEFAULT = 'Something went error, Try again later.';
}

