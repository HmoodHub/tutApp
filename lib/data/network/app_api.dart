import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/constants.dart';
import '../response/responses.dart';


part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseURL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('customer/login')
  Future<AuthResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
