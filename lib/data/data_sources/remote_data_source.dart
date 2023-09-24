import 'package:test_app_mvvm/data/network/app_api.dart';
import 'package:test_app_mvvm/data/network/requests.dart';

import '../response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplement implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplement(this._appServiceClient);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
}
