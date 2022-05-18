import 'package:get/get.dart';

class HomeController extends GetxController {
  //
  //final count1 = 0.obs;
  RxInt current = 0.obs;
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    print(Get.height);
    print(Get.width);
    super.onInit();
  }
}
