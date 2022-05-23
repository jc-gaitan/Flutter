import 'package:flutter/material.dart';

Widget logoGym() {
  final url =
      'https://www.havana-gym.com/wp-content/uploads/2017/06/weblogo.png';

  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      image: NetworkImage(url),
      fadeOutDuration: Duration(milliseconds: 200),
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    ),
  );
}
