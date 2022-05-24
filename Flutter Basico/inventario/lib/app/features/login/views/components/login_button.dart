part of login_view;

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return Container(
          height: 50.0,
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: FutureBuilder(
            future: Authentication.initializeFirebase(context: Get.context!),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Error al inicializar Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return googleSignInButton(_);
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Get.theme.primaryColor,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget googleSignInButton(LoginController _) {
    return SignInButton(
      Buttons.Google,
      text: "Iniciar sesión con Google",
      onPressed: _.signInWithGoogle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // <-- Radius
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
    );
  }
}
