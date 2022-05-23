bool isEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool password(String password) {
  if (password.trim().length > 5) {
    return true;
  } else {
    return false;
  }
}

bool isNumeric(String s) {
  if (s.isEmpty) return false;

  //intentar convertir a s en numero, si el resultado es null no se puede convertir en numero
  final n = num.tryParse(s);

  return (n == null) ? false : true;
}

bool estaturaValida(String s) {
  if (s.length < 3) return false;

  if (s.isEmpty) return false;

  //intentar convertir a s en numero, si el resultado es null no se puede convertir en numero
  var n = num.tryParse(s);

  if (n != null) {
    n = n * 100;
    if (n < 250) {
      return true;
    }
  } else {
    return false;
  }

  return false;
}

bool pesoValido(String s) {
  if (s.isEmpty) return false;

  //intentar convertir a s en numero, si el resultado es null no se puede convertir en numero
  var n = num.tryParse(s);

  if (n != null) {
    if (n < 600 && n > 10) {
      return true;
    }
  } else {
    return false;
  }

  return false;
}

bool edadValida(String s) {
  if (s.isEmpty) return false;

  //intentar convertir a s en numero, si el resultado es null no se puede convertir en numero
  var n = num.tryParse(s);

  if (n != null) {
    if (n < 150 && n > 16) {
      return true;
    }
  } else {
    return false;
  }

  return false;
}
