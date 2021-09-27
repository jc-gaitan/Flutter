part of authentication_view;

class _ResendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("¿No recibiste el código? "),
            Obx(
              () => TextButton(
                onPressed: (_.isCanResendCode.value)
                    ? () => _.verifyPhoneNumber()
                    : null,
                child: Text((_.durationCountdown.value) > 0
                    ? "Reenviar (${_.durationCountdown.value})"
                    : "Reenviar"),
              ),
            )
          ],
        );
      },
    );
  }
}
