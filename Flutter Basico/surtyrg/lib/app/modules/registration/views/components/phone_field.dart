part of registration_view;

class _PhoneField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      builder: (_) {
        return TextFormField(
          inputFormatters: <TextInputFormatter>[
            //Solo deja ingresar numeros
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 10, //numero maximo de caracteres
          controller: _.phoneNumber,
          keyboardType: TextInputType.phone,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.trim() == "") return "";
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.grey,
            ),
            hintText: "Número de teléfono",
            counterStyle: TextStyle(height: 0.5),
          ),
        );
      },
    );
  }
}
