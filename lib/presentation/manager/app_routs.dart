import 'package:flutter/material.dart';
import 'package:test_app_mvvm/app/dependency_injection.dart';
import 'package:test_app_mvvm/presentation/pages/forget_password/forget_pass_screen.dart';
import 'package:test_app_mvvm/presentation/pages/login/login_view/login_screen.dart';
import 'package:test_app_mvvm/presentation/pages/main/main_screen.dart';
import 'package:test_app_mvvm/presentation/pages/register/register_view/register_screen.dart';
import 'package:test_app_mvvm/presentation/pages/splash/splash_screen.dart';
import 'package:test_app_mvvm/presentation/pages/store_details/store_details_screen.dart';

import '../pages/on_boarding/on_boarding_view/on_boarding_screen.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String onBoardingScreen = '/on_boarding';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String forgetPasswordScreen = '/forget_password';
  static const String mainScreen = '/main';
  static const String storeDetailsScreen = '/store_details';

  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case loginScreen:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPassScreen());
      case mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case storeDetailsScreen:
        return MaterialPageRoute(builder: (_) => const StoreDetailsScreen());
      default:
        return null;
    }
  }

  static String get splash => splashScreen;

  static String get onBoarding => onBoardingScreen;

  static String get login => loginScreen;

  static String get register => registerScreen;

  static String get forgetPass => forgetPasswordScreen;

  static String get main => mainScreen;

  static String get storeDetails => storeDetailsScreen;
}
