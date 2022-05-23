import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () => Get.back(),
      splashRadius: 20.0,
    );
  }
}
