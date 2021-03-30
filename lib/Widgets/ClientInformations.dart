import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.put(Controller());

class DemandInformations extends StatelessWidget {
  final List<Demande> demande;
  final bool isVisible;
  const DemandInformations({Key key, this.demande, this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
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
                  border: Border.all(color: Colors.blue, width: 5)),
              width: 400,
              height: 460,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    // width: double.infinity,
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
                            myRow(
                                "Date des le", _controller.demandeDesLe.value),
                            myRow(
                                "Date Jusqua", _controller.demandeJusqua.value),
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
                            Row(
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
                                VerticalDivider(
                                  color: Colors.black,
                                  thickness: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    myRow("Total Poids",
                                        _controller.totlaPoids.value.toString(),
                                        isSmall: true),
                                  ],
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

Widget myRow(String title, String text, {bool isSmall = false}) {
  return DefaultTextStyle(
    style: GoogleFonts.robotoSlab(fontSize: isSmall ? 12 : 16),
    child: Row(
      children: [
        Text(title),
        SizedBox(width: 20),
        Text(text),
      ],
    ),
  );
}

/// this my widget to `make` text with icons
Widget myRowIcon(String title, bool ok) {
  return DefaultTextStyle(
    style: GoogleFonts.robotoSlab(fontSize: 12),
    child: Row(
      children: [
        Icon(
          ok ? Icons.done : null,
          color: Colors.green,
        ),
        Text(title),
      ],
    ),
  );
}
