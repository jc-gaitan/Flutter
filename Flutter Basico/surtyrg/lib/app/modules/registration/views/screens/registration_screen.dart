library registration_view;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:surtyrg/app/modules/registration/controllers/registration_controller.dart';
import 'package:surtyrg/app/utils/constants/assets_constant.dart';

part '../components/header_text.dart';
part '../components/image.dart';
part '../components/login_button.dart';
part '../components/name_field.dart';
part '../components/phone_field.dart';
part '../components/register_button.dart';

class RegistrationScreen extends StatelessWidget {
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
            child: GetBuilder<RegistrationController>(
              init: RegistrationController(),
              builder: (_) {
                return Form(
                  key: _.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _HeaderText(),
                      ),
                      Spacer(flex: 4),
                      _Image(),
                      Spacer(flex: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _NameField(),
                      ),
                      Spacer(flex: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _PhoneField(),
                      ),
                      Spacer(flex: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _RegisterButton(),
                      ),
                      Spacer(flex: 5),
                      _LoginButton(),
                      Spacer(flex: 2),
                    ],
                  ),
                );
              },
            ),
          ),
        ]))
      ],
    ));
  }
}
