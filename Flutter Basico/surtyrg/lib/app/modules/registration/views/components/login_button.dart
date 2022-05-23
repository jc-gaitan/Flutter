part of registration_view;

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("¿Ya tienes una cuenta?"),
            TextButton(
              onPressed: () => _.goToLoginScreen(),
              child: Text(" Iniciar sesión"),
            )
          ],
        );
      },
    );
  }
}
