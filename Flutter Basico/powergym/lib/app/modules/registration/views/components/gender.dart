part of registration_view;

class Gender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      id: 'gender',
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Masculino',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 5.0,
            ),
            _checkBoxMan(_),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Femenino',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 5.0,
            ),
            _checkBoxWoman(_),
          ],
        );
      },
    );
  }

  Widget _checkBoxWoman(RegistrationController _) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.grey),
      child: Checkbox(
        //color icono -> chulito cuando esta activo
        checkColor: Colors.white,
        //backgraoun cuando esta activo
        activeColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        value: _.female,
        onChanged: (valor) {
          _.changeFemale(valor);
        },
      ),
    );
  }

  Widget _checkBoxMan(RegistrationController _) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.grey),
      child: Checkbox(
        //color icono -> chulito cuando esta activo
        checkColor: Colors.white,
        //backgraoun cuando esta activo
        activeColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        value: _.male,
        onChanged: (valor) {
          _.changeMale(valor);
        },
      ),
    );
  }
}
