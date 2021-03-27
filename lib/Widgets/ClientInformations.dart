import 'package:administration/Logics/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.put(Controller());

class ClientInformations extends StatelessWidget {
  const ClientInformations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Obx(
      () => Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        elevation: 30,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                border: Border.all(color: Colors.blue, width: 5)),
            width: 500,
            height: _height / 3,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Text("Informations de domande",
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22)),
                ),
                Flexible(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          myRow(
                              "Categorie", _controller.demandeCategorie.value),
                          myRow("Départ", _controller.demandeLocalite.value),
                          myRow("Destination",
                              _controller.demandeDestination.value),
                          myRow("Date des le", _controller.demandeDesLe.value),
                          myRow("Date Jusqua", _controller.demandeJusqua.value),
                          myRow("Client", _controller.userName.value),
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }
}

Widget myRow(String title, String text) {
  return DefaultTextStyle(
    style: GoogleFonts.robotoSlab(fontSize: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(text),
      ],
    ),
  );
}
