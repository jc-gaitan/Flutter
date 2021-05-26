import 'package:flutter/material.dart';
import 'package:listview_widget/model/ContactModel.dart';
import 'package:listview_widget/pages/ContactList.dart';

class Contact extends StatelessWidget {
  _buildList() {
    return <ContactModel>[
      const ContactModel(
          name: "Rodrigo Morales", email: "rodrigo.morales@hotmail.com"),
      const ContactModel(name: "Juan Gaitan", email: "gaitan@hotmail.com"),
      const ContactModel(name: "Andrea Rojas", email: "rojas@hotmail.com"),
      const ContactModel(
          name: "Sandra Villegas", email: "villegas@hotmail.com"),
      const ContactModel(name: "Jose Velandia", email: "velandia@hotmail.com"),
      const ContactModel(name: "Jarvan Vargas", email: "vargas@hotmail.com"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ContacList(_buildList()),
    );
  }
}
