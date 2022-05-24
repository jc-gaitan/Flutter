import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:inventario/app/config/routes/app_pages.dart';
import 'package:inventario/app/providers/auth.dart';

class LoginController extends GetxController {
  //bool expanded = false;
  bool isLoading = false;

  @override
  void onInit() async {
    Authentication.signOut();
    super.onInit();
  }

  void signInWithGoogle() async {
    isLoading = true;
    update();

    User? user = await Authentication.signInWithGoogle(context: Get.context!);

    if (user != null) {
      //print(user.displayName);
      Get.offAndToNamed(Routes.home, arguments: [user.email]);
    }

    isLoading = false;
    update();
  }
}
