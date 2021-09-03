part of login_view;

class _RegistrationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("¿No tienes una cuenta?"),
            TextButton(
              onPressed: () => _.goToRegistrationScreen(),
              child: Text(" Registrarse"),
            )
          ],
        );
      },
    );
  }
}
