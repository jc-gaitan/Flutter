part of login_view;

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Iniciar sesión", style: Theme.of(context).textTheme.headline5),
        SizedBox(height: 5),
        Text(
          "Por favor, ingrese su número de teléfono para iniciar sesión. ",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
