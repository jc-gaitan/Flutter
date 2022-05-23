part of registration_view;

class _PhoneField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    var countryCode = Container(
      width: 68.0,
      decoration: new BoxDecoration(
        color: Colors.transparent,
        border: Border(
          right: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      height: 45.0,
      margin: const EdgeInsets.all(3.0),
      //width: 300.0,
      child: Center(
        child: new Text(
          '+57',
          style: TextStyle(fontSize: 16.0, color: Colors.grey),
        ),
      ),
    );

    return GetBuilder<RegistrationController>(
      builder: (_) {
        return TextFormField(
          enabled: false,
          //controller: _.phoneNumber,
          //
          /*inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],*/
          //keyboardType: TextInputType.phone,
          //maxLength: 10,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          /*validator: (value) {
            if (value == null || value.trim() == "") return "";
            return null;
          },*/
          //
          decoration: InputDecoration(
            //contentPadding: EdgeInsets.all(12.0),
            prefixIcon: countryCode,
            hintText: _.phoneNumber,
            counterStyle: TextStyle(height: 0.5, color: Colors.transparent),
          ),
        );
      },
    );
  }
}
