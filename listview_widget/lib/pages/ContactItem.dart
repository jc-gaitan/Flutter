import 'package:flutter/material.dart';
import 'package:listview_widget/model/ContactModel.dart';

class ContactItem extends StatelessWidget {
  final ContactModel _contacts;
  ContactItem(this._contacts);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new CircleAvatar(
        child: new Text(_contacts.name[0]),
      ),
      title: new Text(_contacts.name),
      subtitle: new Text(_contacts.email),
    );
  }
}
