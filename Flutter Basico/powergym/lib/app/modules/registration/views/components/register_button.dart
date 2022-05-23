part of registration_view;

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      id: 'registerButton',
      builder: (_) {
        return ElevatedButton(
          onPressed: _.isLoading.value ? null : () => _.register(),
          child: _.isLoading.value
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                )
              : Text("Registrar datos"),
        );
      },
    );
  }
}
