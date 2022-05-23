import 'package:get/get.dart';

class BusinessController extends GetxController {
  //
  String descText =
      "El asesinato de Calvo Sotelo se produjo en Madrid (España) en la madrugada del lunes 13 de julio de 1936, durante la Segunda República Española, cuando un grupo de guardias de asalto y de miembros de las milicias socialistas encabezado por un capitán de la Guardia Civil de paisano se presentaron en el domicilio del líder monárquico José Calvo Sotelo con el pretexto de conducirlo a la Dirección General de Seguridad y, en el trayecto, el socialista Luis Cuenca Estevas le disparó dos tiros en la nuca, llevando a continuación su cuerpo al depósito de cadáveres del cementerio de La Almudena. El crimen era una represalia por el asesinato unas";
  RxBool descTextShowFlag = false.obs;

  RxInt a = 0.obs;

  double calSpace(int space) {
    return (space * 100) / Get.height;
  }
}
