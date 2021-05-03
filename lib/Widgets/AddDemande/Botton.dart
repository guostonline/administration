import 'package:administration/Logics/ErrorHandl.dart';
import 'package:administration/Logics/FireStore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAddBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 40,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 50,
        child: Row(
          children: [
            MaterialButton(
              animationDuration: Duration(seconds: 1),
              color: Colors.green[600],
              elevation: 15,
              hoverColor: Colors.blue,
              child: Text("Ajouter",
                  style: GoogleFonts.robotoSlab(color: Colors.white)),
              onPressed: () {
                if (allFieldsAreComplete()) {
                  saveInformationToFireStore().then((_) => AwesomeDialog(
                      context: context,
                      body: Text("Le demande est bien enregistré"),
                      dialogType: DialogType.SUCCES,
                      //autoHide: Duration(seconds: 3),
                      headerAnimationLoop: false,
                      btnOkOnPress: () {},
                      width: 400)
                    ..show());
                  
                } else
                  AwesomeDialog(
                      context: context,
                      body: Text("Remplire tout les obligatoire champ. SVP"),
                      dialogType: DialogType.ERROR,
                      //autoHide: Duration(seconds: 3),
                      headerAnimationLoop: false,
                      btnOkOnPress: () {},
                      width: 400)
                    ..show();
                // print(_controller.addDateDesLe.value);
              },
            )
          ],
        ),
      ),
    );
  }
}
