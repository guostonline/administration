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
        elevation: 20,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                border: Border.all(color: Colors.blue, width: 5)),
            width: _width / 2,
            height: _height / 4,
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
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Demande Categorie:      "),
                          Text(_controller.demandeCategorie.value),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Localité :        "),
                          Text(_controller.demandeLocalite.value),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Destination:        "),
                          Text(_controller.demandeDestination.value),
                        ],
                      ),
                    ],
                  )),
                ),
              ],
            )),
      ),
    );
  }
}
