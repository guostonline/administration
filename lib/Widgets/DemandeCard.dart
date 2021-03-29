import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget demandeCard(
    {String categorie,
    String localite,
    String destination,
    String deLe,
    String jusqua,
    bool charge,
    bool montage,
    bool emballage,
    bool facture,
    String userName,
    String email}) {
  return Container(
    width: 400,
    height: 200,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.blue,
        Colors.red,
      ],
    )),
    child: Row(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              maxRadius: 20,
              backgroundImage: AssetImage("images/demenagement.jpg"),
            ),
            VerticalDivider(),
            CircleAvatar(
              maxRadius: 20,
              backgroundImage: AssetImage("images/user.png"),
            ),
          ],
        ),
        VerticalDivider(),
        DefaultTextStyle(
          style: GoogleFonts.robotoSlab(fontSize: 16, color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(categorie),
              Divider(
                color: Colors.white,
                thickness: 5,
                endIndent: 2,
                indent: 10,
              ),
              myRow(localite, destination),
              myRow(deLe, jusqua),
              Divider(),
              myOption(
                  charge: charge,
                  montage: montage,
                  embalage: emballage,
                  facture: facture),
              userInformations(userName, email),
            ],
          ),
        )
      ],
    ),
  );
}

Widget myRow(String title1, String title2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(title1),
      Text(title2),
    ],
  );
}

Widget myOption(
    {bool charge = false,
    bool montage = false,
    bool embalage = false,
    bool facture = false}) {
  return DefaultTextStyle(
    style: GoogleFonts.robotoSlab(fontSize: 12, color: Colors.white),
    child: Row(
      children: [
        Column(
          children: [
            Text("Charge-Décharge"),
            charge
                ? Icon(Icons.circle, color: Colors.green)
                : Icon(Icons.circle, color: Colors.grey),
          ],
        ),
        VerticalDivider(
          color: Colors.white,
        ),
        Column(
          children: [
            Text("Montage-Démontage"),
            montage
                ? Icon(Icons.circle, color: Colors.green)
                : Icon(Icons.circle, color: Colors.grey),
          ],
        ),
        VerticalDivider(),
        Column(
          children: [
            Text("Besoin d'emballage"),
            embalage
                ? Icon(Icons.circle, color: Colors.green)
                : Icon(Icons.circle, color: Colors.grey),
          ],
        ),
        VerticalDivider(),
        Column(
          children: [
            Text("Facture"),
            facture
                ? Icon(Icons.circle, color: Colors.green)
                : Icon(Icons.circle, color: Colors.grey),
          ],
        ),
        VerticalDivider(),
      ],
    ),
  );
}

Widget userInformations(String userName, String email) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [Text(userName), Text(email)],
  );
}
