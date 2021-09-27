part of authentication_view;

class _VerificationButton extends StatelessWidget {
  const _VerificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      id: 'verificationButton',
      builder: (_) {
        return ElevatedButton(
          onPressed: _.isLoading.value ? null : () => _.verifySmsCode(),
          child: _.isLoading.value
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                )
              : Text("Verificar"),
        );
      },
    );
  }
}
