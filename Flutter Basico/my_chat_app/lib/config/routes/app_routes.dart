part of 'app_pages.dart';

abstract class Routes {
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const chat = _Paths.chat;
  static const notfound = _Paths.notfound;
}

abstract class _Paths {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const chat = '/chat';
  static const notfound = '/notfound';
}
