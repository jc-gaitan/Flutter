import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large,
  "input": Icons.input,
  "slider": Icons.tune,
  "list": Icons.list,
};

Icon getIcon(String nombreIcon) {
  return Icon(
    _icons[nombreIcon],
    color: Colors.blue,
  );
}
