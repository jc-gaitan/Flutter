part of registration_view;

class _HeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Crear cuenta", style: Theme.of(context).textTheme.headline5),
        SizedBox(height: 5),
        Text(
          "Por favor, ingrese su nombre y número de teléfono para registrarse",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
