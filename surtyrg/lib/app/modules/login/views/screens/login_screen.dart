library login_view;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:surtyrg/app/modules/login/controllers/login_controller.dart';
import 'package:surtyrg/app/utils/constants/assets_constant.dart';

part '../components/header_text.dart';
part '../components/image.dart';
part '../components/phone_field.dart';
part '../components/registration_button.dart';
part '../components/login_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: _HeaderText(),
                    ),
                    Spacer(flex: 4),
                    _Image(),
                    Spacer(flex: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: _PhoneField(),
                    ),
                    Spacer(flex: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _LoginButton(),
                    ),
                    Spacer(flex: 5),
                    _RegistrationButton(),
                    Spacer(flex: 2),
                  ],
                );
              },
            ),
          ),
        ]))
      ],
    ));
  }
}
