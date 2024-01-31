import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:inventario/config/routes/app_pages.dart';
import 'package:inventario/providers/auth_provider.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    Authentication.signOut();
    super.onInit();
  }

  void signInWithGoogle() async {
    isLoading.value = true;

    User? user = await Authentication.signInWithGoogle(context: Get.context!);

    if (user != null) {
      //print(user.displayName);
      Get.offAndToNamed(Routes.home, arguments: [user.email]);
    }

    isLoading.value = false;
  }
}
