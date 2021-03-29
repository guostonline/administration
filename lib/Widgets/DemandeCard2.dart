import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.put(Controller());

class DemandeCard2 extends StatelessWidget {
  final List<Demande> demande;

  DemandeCard2({this.demande});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 400,
        height: 400,
        child: Card(
          elevation: 20,
          child: ListView.builder(
            itemCount: demande.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 10,
                margin: EdgeInsets.all(15),
                child: ListTile(
                  onTap: () {
                    _controller.setDemande(demande[index]);
                    _controller.userName.value =
                        findUser(demande[index].user).name;
                  },
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
                            VerticalDivider(
                              color: Colors.black,
                            ),
                            Text(findUser(demande[index].user).email),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
