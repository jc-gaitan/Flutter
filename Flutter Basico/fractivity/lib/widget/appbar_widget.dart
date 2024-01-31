import 'package:flutter/material.dart';
import 'package:fractivity/utils/constants.dart';

PreferredSizeWidget appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(40.0),
    child: AppBar(
      centerTitle: true,
      elevation: 2.0,
      title: Text(
        title, //_controller.activity,
        style: titleStyle,
      ),
    ),
  );
}
