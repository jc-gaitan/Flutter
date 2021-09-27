import 'package:flutter/material.dart';
import 'package:powergym/app/utils/constants/assets_constant.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image(
          image: AssetImage(ImageRasterConstant.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
