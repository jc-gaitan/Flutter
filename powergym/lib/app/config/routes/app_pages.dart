import 'package:get/get.dart';
import 'package:powergym/app/modules/authentication/views/screens/authentication_screen.dart';
import 'package:powergym/app/modules/home/views/screens/home_screen.dart';

import 'package:powergym/app/modules/login/views/screens/login_screen.dart';
import 'package:powergym/app/modules/registration/views/screens/registration_screen.dart';
import 'package:powergym/app/modules/splash/views/screens/splash_screen.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginScreen(),
      //binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.registration,
      page: () => RegistrationScreen(),
      //binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.authentication,
      page: () => AuthenticationScreen(),
      transition: Transition.cupertino,
      //binding: AuthenticationBinding()
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeScreen(),
      //binding: HomeBinding(),
    )
  ];
}
