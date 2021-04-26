import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:administration/Logics/FireStore.dart';
import 'package:administration/Widgets/InformationWidget/BottonWidget.dart';
import 'package:administration/Widgets/InformationWidget/rowWidgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

Controller _controller = Get.find();

class DemandInformations extends StatelessWidget {
  final List<Demande> demande;
  final bool isVisible;
  const DemandInformations({Key key, this.demande, this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: _controller.isVisible.value,
        child: Card(
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
                border: Border.all(color: Colors.green[800], width: 5)),
            width: 400,
            height: 590,
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Informations ",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_controller.demandeCategorie.value,
                                  style: GoogleFonts.robotoSlab(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    selectCategorieImage(
                                        _controller.demandeCategorie.value)),
                              ),
                            ],
                          ),
                          myRow("Départ", _controller.demandeLocalite.value),
                          myRow("Destination",
                              _controller.demandeDestination.value),
                          myRow("Date des le", _controller.demandeDesLe.value),
                          myRow("Date Jusqua", _controller.demandeJusqua.value),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(_controller.userName.value,
                                  minFontSize: 20,
                                  style: GoogleFonts.robotoSlab(
                                      fontWeight: FontWeight.bold)),
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    _controller.userPhotoUrl.value),
                              ),
                            ],
                          ),
                          myRow("Email", _controller.userEmail.value),
                          myRow("Téléphone", _controller.userPhone.value),
                          SizedBox(height: 15),
                          Divider(),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    myRowIcon(
                                        "Charge-Décharge",
                                        _controller
                                            .demandeChargeDecharge.value),
                                    myRowIcon(
                                        "Montage-Démontage",
                                        _controller
                                            .demandeCMontageDemontage.value),
                                    myRowIcon(
                                        "Besoin d'emballage",
                                        _controller
                                            .demandeBesoinEmbalage.value),
                                    myRowIcon("Avec Facture",
                                        _controller.demandeAvecFacture.value),
                                  ],
                                ),
                                SizedBox(width: 20),
                                VerticalDivider(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                SizedBox(width: 20),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      myRow(
                                          "Nomber Salons",
                                          _controller.numberSalon.value
                                              .toString(),
                                          isSmall: true),
                                      myRow(
                                          "Nomber Produits",
                                          _controller.numberProduit.value
                                              .toString(),
                                          isSmall: true),
                                      myRow(
                                          "Total Poids",
                                          _controller.totlaPoids.value
                                              .toString(),
                                          isSmall: true),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                Divider(),
                BottonInformation(),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: _controller.demandeID.isEmpty ? false : true,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            elevation: 15,
                            shadowColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            body: Text("Sauver les modifications?"),
                            dialogType: DialogType.QUESTION,
                            width: 400,
                            headerAnimationLoop: false,
                            btnOkOnPress: () {
                              updateDataToFireStore(_controller.demandeID, {
                                "Vue": _controller.demandeVue.value,
                                "Repondu": _controller.demandeRepondu.value,
                                "Refus": _controller.demandeRefus.value,
                                "Valider": _controller.demandeValider.value
                              });
                            },
                            btnCancelOnPress: () {},
                          )..show();
                        },
                        child: Text("Valider"),
                      ),
                    ),
                    Visibility(
                      visible: _controller.demandeID.isEmpty ? false : true,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            elevation: 15,
                            shadowColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        onPressed: () {
                          AwesomeDialog(
                              context: context,
                              body: Text("Vous les vous supprimé ce demande?"),
                              dialogType: DialogType.QUESTION,
                              headerAnimationLoop: false,
                              btnOkOnPress: () {
                                deleteDemandeFromFireStore(
                                    _controller.demandeID);
                              },
                              btnCancelOnPress: () {},
                              width: 400)
                            ..show();
                        },
                        child: Text("Supprimé"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
