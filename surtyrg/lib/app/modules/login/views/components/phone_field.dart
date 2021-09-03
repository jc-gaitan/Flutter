part of login_view;

class _PhoneField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Form(
          key: _.formKey,
          child: TextFormField(
            controller: _.phoneNumber,
            //Solo numeros
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLength: 10, //numero maximo de caracteres
            keyboardType: TextInputType.phone,
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
          ),
        );
      },
    );
  }
}
