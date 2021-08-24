import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String phone = '';
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            IntlPhoneField(
              //Solo numeros
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              //tipo teclado number
              keyboardType: TextInputType.number,
              //keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                hintText: "Número de teléfono",
              ),
              initialCountryCode: 'CO',
              controller: controller,
              onChanged: (phoneNumber) {
                phone = phoneNumber.completeNumber;
              },
              onCountryChanged: (phoneNumber) {
                controller.text = ''; //vaciar el input cuando cambie de pais
                phone = phoneNumber.completeNumber;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (phone != '') {
                  print(phone);
                } else {
                  print('vacio');
                }
              },
              child: Text('Enviar'),
              style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: CustomAppBar(),
    );
  }
}
