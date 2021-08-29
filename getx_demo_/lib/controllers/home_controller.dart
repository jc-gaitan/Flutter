import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    this._counter++;
    update(['contador']);
  }

  @override
  void onInit() {
    //Es lo mismo que un initState
    super.onInit();
    print('OnInit');
  }

  @override
  void onReady() {
    //Se ejecuta una sola vez cuando el witget ya ha sido renderizado en pantalla
    super.onReady();
    print('OnReady');
  }
}
