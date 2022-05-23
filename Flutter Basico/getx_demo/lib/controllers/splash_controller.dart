import 'package:get/get.dart';
import 'package:getx_demo/pages/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      Get.off(HomePage(), transition: Transition.zoom);
    });
    //Get.off -> Navega a la nueva ruta y no se puede volver hacia atras es igual a pushReplacement
    //Get.to -> Navega a un nueva ruta
  }

  @override
  void onClose() {
    //Es como Dispose
    super.onClose();
    print('OnClose');
  }
}
