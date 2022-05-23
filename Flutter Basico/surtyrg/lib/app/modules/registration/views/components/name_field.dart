part of registration_view;

class _NameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      builder: (_) {
        return TextFormField(
          keyboardType: TextInputType.name,
          controller: _.name,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.trim() == "") return "";
            return null;
          },
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: "Nombre"),
        );
      },
    );
  }
}
