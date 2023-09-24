import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_mvvm/data/data_sources/remote_data_source.dart';
import 'package:test_app_mvvm/data/network/app_api.dart';
import 'package:test_app_mvvm/data/network/dio_factory.dart';
import 'package:test_app_mvvm/data/network/network_conniction_checker.dart';
import 'package:test_app_mvvm/data/repositories/login_response.dart';
import 'package:test_app_mvvm/domain/repositories/repository.dart';
import 'package:test_app_mvvm/domain/use_cases/login_usecases.dart';
import 'package:test_app_mvvm/presentation/pages/login/login_view_model/login_view_model.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // use in app one time in anything, his name is (singleton or lazy singleton).
  /**
   * // when register this instance, is set in sametime.
   * // this is singleton.
   * /************************************************************************/
   * When it is formed,
   * it is formed once and remains that way this time,
   * but what is preferable in this type is that it is formed the first time when it is called for the first time,
   * and this preserves RAM and cache.
   * this is lazy singleton (the beast).
   */
  // Shared pref.
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // now my app is create instance from Shared Preferences, now I can use shared prefs in my app.
  // App Preference
  final sharedPrefsApp = AppPreferences(instance<SharedPreferences>());
  instance.registerLazySingleton<AppPreferences>(() => sharedPrefsApp);
  // Dio Factory
  final dioFactory = DioFactory(instance<AppPreferences>());
  instance.registerLazySingleton<DioFactory>(() => dioFactory);
  // App Service client
  Dio dio = await instance<DioFactory>().getDio();
  final appServiceClient = AppServiceClient(dio);
  instance.registerLazySingleton<AppServiceClient>(() => appServiceClient);
  // Remote data source
  final remoteDataSource =
      RemoteDataSourceImplement(instance<AppServiceClient>());
  instance.registerLazySingleton<RemoteDataSource>(() => remoteDataSource);
  // Network Information check
  final networkCheck = CheckNetwork(InternetConnectionChecker());
  instance.registerLazySingleton<NetworkInfo>(() => networkCheck);
  // Repository
  final repository = RepositoryImplement(
      instance<NetworkInfo>(), instance<RemoteDataSource>());
  instance.registerLazySingleton<Repository>(() => repository);
}

initLoginModule() {
  // use in custom thing like login or register..., his name is (factory singleton).
  // This must have been unregistered before because it is used once and then dies (becomes unregistered) so we use GET.I.REGISTERED
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // Login Use Case
    final loginUseCase = LoginUseCase(instance<Repository>());
    instance.registerFactory<LoginUseCase>(() => loginUseCase);
    // Login View Model
    final loginViewModel = LoginViewModel(instance<LoginUseCase>());
    instance.registerFactory<LoginViewModel>(() => loginViewModel);
  }
}
