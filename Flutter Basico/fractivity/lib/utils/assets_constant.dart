abstract class ImagesConstant {
  static const _folder = "assets/images/";

  static const logo = "${_folder}icon.png";

  static const options = [
    "${_folder}simples.png",
    //"${_folder}mixtos.png",
    //"${_folder}equivalencia.png",
    //"${_folder}comparar.png",
    "${_folder}suma.png",
    "${_folder}resta.png",
    "${_folder}multiplicacion.png",
    "${_folder}division.png",
  ];
}

abstract class ActConstant {
  static const _folder = "assets/gifs/";
  static const _folderImg = "assets/images/";

  static const simples = [
    "${_folderImg}simples_act1.png",
    "${_folder}simples.gif",
  ];

  static const suma = [
    "${_folder}suma.gif",
    "${_folder}suma2.gif",
  ];

  static const resta = [
    "${_folder}resta.gif",
    "${_folder}resta2.gif",
  ];

  static const multiplicacion = [
    "${_folder}multiplicacion.gif",
  ];

  static const division = [
    "${_folder}division.gif",
    "${_folder}division2.gif",
  ];
}
