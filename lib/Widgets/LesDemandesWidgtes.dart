import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/GetDateFireBase.dart';
import 'package:administration/Widgets/DemandeCard.dart';
import 'package:administration/backup/Demande';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.put(Controller());

class DomandeWidget extends StatelessWidget {
  const DomandeWidget({Key key, @required this.demandesList}) : super(key: key);
  final List demandesList;
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Container(
        width: 550,
        height: 600,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.redAccent,
              child: Text("Les demandes",
                  style: GoogleFonts.abel(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount: demandesList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        child: InkWell(
                            onTap: () {
                              getOneUser(demandesList[index].user);
                              _controller.setDemande(demandesList[index]);
                            },
                            child: demandeCard(
                              categorie: demandesList[index].categorie,
                              localite: demandesList[index].localite,
                              destination: demandesList[index].destination,
                              deLe: demandesList[index].desLe,
                              jusqua: demandesList[index].jusqua,
                              charge: demandesList[index].chargeDecharge,
                              montage: demandesList[index].montageDemontage,
                              emballage: demandesList[index].besoiEmballage,
                              facture: demandesList[index].demnadeDeFacture,
                              email: "guostonline@gmail.commmm",
                              userName: "chakib elfil",
                            )),
                      );
                    }),
              ),
            ),
          ],
        ));
  }
}
