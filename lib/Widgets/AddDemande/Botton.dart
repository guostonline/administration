import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/FireStore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAddBotton extends StatelessWidget {
  Controller _controller = Get.put(Controller());

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
                saveInformationToFireStore();
                print(_controller.addDateDesLe.value);
              },
            )
          ],
        ),
      ),
    );
  }
}
