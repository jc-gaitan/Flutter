import 'package:get/get.dart';

class HomeController extends GetxController {
  int page = 0;

  @override
  void onInit() async {
    //var email = Get.arguments;
    //print(email);
    super.onInit();
  }

  double tam(int x) {
    if (x == 0) {
      return 0.06;
    } else if (x == 3) {
      return 0.08;
    } else {
      return 0.03;
    }
  }
}
