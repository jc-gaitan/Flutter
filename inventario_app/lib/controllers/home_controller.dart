import 'package:get/get.dart';

class HomeController extends GetxController {
  //
  //final count1 = 0.obs;
  RxInt current = 0.obs;
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    var email = Get.arguments;
    print(email);
    print(Get.height);
    print(Get.width);
    super.onInit();
  }
}
