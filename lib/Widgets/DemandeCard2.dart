import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:administration/Logics/GetDateFireBase.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DemandeCard2 extends StatelessWidget {
  final List<Demande> demande;

  DemandeCard2({this.demande});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 350,
        height: 400,
        child: Card(
          elevation: 20,
          child: ListView.builder(
            itemCount: demande.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/user.png"),
                ),
                title: Text(demande[index].categorie),
               dense: true,
                subtitle: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(demande[index].localite),
                        Flexible(child: Divider(color: Colors.black)),
                        Text(">"),
                        Text(demande[index].destination),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("<"),
                        Text(demande[index].desLe),
                        Flexible(child: Divider(color: Colors.black)),
                        Text(">"),
                        Text(demande[index].jusqua),

                      ],
                    ),
                    Divider(),

                    DefaultTextStyle(
                      style: GoogleFonts.robotoSlab(fontSize: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(findUser(demande[index].user).name),
                          Text(findUser(demande[index].user).email),
                        ],
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
