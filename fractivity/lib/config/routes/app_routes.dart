part of 'app_pages.dart';

abstract class Routes {
  static const splash = _Paths.splash;
  static const home = _Paths.home;
  static const learn = _Paths.learn;
  static const challenge = _Paths.challenge;
  static const activity = _Paths.activity;
}

abstract class _Paths {
  static const splash = '/splash/';
  static const home = '/home/';
  static const learn = '/learn/';
  static const challenge = '/challenge/';
  static const activity = '/activity/';
}
