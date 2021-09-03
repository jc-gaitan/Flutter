part of authentication_view;

class _HeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (_) {
        return Column(
          children: [
            Text("Código de verificación",
                style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText2,
                  children: [
                    TextSpan(text: "Por favor ingrese el código enviado a "),
                    TextSpan(
                        text: _.phoneNumber ?? _.registrant!.phoneNumber,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 16))
                  ]),
              textAlign: TextAlign.center,
            )
          ],
        );
      },
    );
  }
}
