import 'package:fractivity/screen/challenge_screen.dart';
import 'package:fractivity/screen/home_screen.dart';
import 'package:fractivity/screen/learn_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: _Paths.learn,
      page: () => LearnScreen(),
    ),
    GetPage(
      name: _Paths.challenge,
      page: () => ChallengeScreen(),
    ),
    /*GetPage(
      name: _Paths.activity,
      page: () => ActivityScreen(),
    ),*/
  ];
}
