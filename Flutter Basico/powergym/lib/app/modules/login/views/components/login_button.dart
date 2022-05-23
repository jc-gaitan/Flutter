part of login_view;

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: 'loginButton',
      builder: (_) {
        return ElevatedButton(
          onPressed: _.isLoading.value ? null : () => _.login(),
          child: _.isLoading.value
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                )
              : Text("Iniciar sesión"),
        );
      },
    );
  }
}
