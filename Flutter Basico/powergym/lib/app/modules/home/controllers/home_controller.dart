import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:powergym/app/config/routes/app_pages.dart';
import 'package:powergym/app/models/user_model.dart';
import 'package:powergym/app/providers/user_provider.dart';

class HomeController extends GetxController {
  final _auth = FirebaseAuth.instance;
  late Rx<UserModel?> user = Rx(null);
  var isLoading = true.obs;
  late int page;
  late String titulo;

  @override
  void onInit() async {
    UserProvider.getUser().then((result) {
      user.value = result;
      isLoading.value = false;
      update(['MyActivity']);
    });
    titulo = 'Mi Actividad';
    page = 1;
    super.onInit();
  }

  void updateAppbar(int page) {
    List<String> titulos = ['Mi Actividad', 'Mi Progreso', 'Nutrición'];
    this.page = page;

    switch (page) {
      case 1:
        titulo = titulos[0];
        break;
      case 2:
        titulo = titulos[1];
        break;
      case 3:
        titulo = titulos[2];
        break;
      default:
        titulo = '';
    }

    update(['appbar']);
  }

  void logout() async {
    await _auth.signOut().then((value) => Get.offNamed(Routes.login));
  }
}
