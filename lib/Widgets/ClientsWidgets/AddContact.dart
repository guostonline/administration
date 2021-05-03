import 'package:administration/Logics/Extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _formKey = GlobalKey<FormState>();

class AddContact extends StatelessWidget {
  const AddContact({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
          border: Border.all(color: Colors.blue, width: 5)),
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ajouter client",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Divider(),
                TextFormField(
                  decoration: InputDecoration(labelText: "Nom et prénom"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Entree nom et prénom de client";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value.isEmpty || !value.isEmailValid()) {
                      return "Entree valide Email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Numéro de téléphone",
                  ),
                  validator: (value) {
                    if (value.isEmpty || !value.isNumeric()) {
                      return "Entree valide numéro de téléphone";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) print("is ok");
                  },
                  child: Text("test"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
