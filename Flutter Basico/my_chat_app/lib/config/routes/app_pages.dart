import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_chat_app/pages/chat_page.dart';
import 'package:my_chat_app/pages/login_page.dart';
import 'package:my_chat_app/pages/register_page.dart';
import 'package:my_chat_app/pages/splash_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: _Paths.chat,
      page: () => ChatPage(),
    ),
    GetPage(
      name: _Paths.notfound,
      page: () => LoginPage(),
    ),
  ];
}
