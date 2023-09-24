// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_app_mvvm/app/app_prefs.dart';
import 'package:test_app_mvvm/app/constants.dart';

const APPLICATION_JSON = 'application/json';
const CONTENT_TYPE = 'content-type';
const ACCEPT = 'accept';
const AUTHORIZATION = 'authorization';
const DEFAULT_LANGUAGE = 'language';

class DioFactory {

  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);


  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = _appPreferences.language;
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: language,
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseURL,
      headers: headers,
      receiveTimeout: Constants.API_timeOut,
      sendTimeout: Constants.API_timeOut,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }
}
