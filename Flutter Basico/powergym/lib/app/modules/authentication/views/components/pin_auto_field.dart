part of authentication_view;

class _PinAutoField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (_) {
        return Form(
          key: _.formKey,
          child: Container(
            child: Theme(
              data: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                    fillColor: Theme.of(context).canvasColor),
              ),
              child: PinFieldAutoFill(
                controller: _.otp,
                codeLength: 6,
                decoration: BoxLooseDecoration(
                  bgColorBuilder: FixedColorBuilder(Colors.grey[300]!),
                  strokeColorBuilder: FixedColorBuilder(Colors.grey[300]!),
                  gapSpace: 10,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
