import 'package:administration/Widgets/ClientsWidgets/AddContact.dart';
import 'package:administration/Widgets/ClientsWidgets/LesClientsWidgets.dart';
import 'package:administration/Widgets/ClientsWidgets/ShowInformations.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            ClientsWidget(),
            ClientInformation(),
            AddContact(),
          ],
        ),
      ),
    );
  }
}
