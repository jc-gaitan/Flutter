import 'package:get/get.dart';
import 'package:my_chat_app/config/routes/app_pages.dart';
import 'package:my_chat_app/constant/constant.dart';

class SplashController extends GetxController {
  //
  @override
  onInit() {
    super.onInit();
    _redirect();
  }

  Future<void> _redirect() async {
    // await for for the widget to mount --NO BORRAR SI NO FUNCIONA
    await Future.delayed(Duration.zero);

    final session = supabase.auth.currentSession;
    if (session == null) {
      Get.offAllNamed(Routes.login);
    } else {
      Get.offAllNamed(Routes.chat);
    }
  }
}
