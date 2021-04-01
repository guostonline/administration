import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:administration/Widgets/ClientInformations.dart';
import 'package:administration/Widgets/DemandesWidgets/FilterDemandOption.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.put(Controller());

class DemandeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 440,
      height: 730,
      child: Obx(
        () => Card(
          margin: EdgeInsets.all(5),
          elevation: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Les demandes",
                    style: GoogleFonts.robotoSlab(fontSize: 25)),
              ),
              TextField(
                  onChanged: (value) {
                    _controller.demandesFiltrie.assignAll(_controller.demandes
                        .where((element) =>
                            element.localite
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            element.destination
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            element.desLe
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            element.jusqua
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                        .toList());
                  },
                  decoration: InputDecoration(
                      hintText: "Rechercher dans les demandes..")),
              FilterDemandeOptions(),
              Container(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _controller.demandesFiltrie.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 10,
                      margin: EdgeInsets.all(15),
                      child: ListTile(
                        isThreeLine: true,
                        onTap: () {
                          //_controller.setDemande(demande[index]);

                          _controller.isVisible.value = true;
                          _controller
                              .setDemande(_controller.demandesFiltrie[index]);
                          _controller.userName.value =
                              findUser(_controller.demandesFiltrie[index].user)
                                  .name;
                        },
                        trailing: threeDot(
                            vue: _controller.demandesFiltrie[index].vue,
                            valide: _controller.demandesFiltrie[index].valider,
                            refus: _controller.demandesFiltrie[index].refus),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              findUser(_controller.demandesFiltrie[index].user)
                                  .photoUrl),
                        ),
                        title: Text(
                            _controller.demandesFiltrie[index].categorie,
                            style: GoogleFonts.robotoSlab(fontSize: 15)),
                        dense: true,
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_controller
                                    .demandesFiltrie[index].localite),
                                Flexible(child: Divider(color: Colors.black)),
                                Text(">"),
                                Text(_controller
                                    .demandesFiltrie[index].destination),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_controller.demandesFiltrie[index].desLe),
                                Text("<"),
                                Flexible(child: Divider(color: Colors.black)),
                                Text(">"),
                                Text(_controller.demandesFiltrie[index].jusqua),
                              ],
                            ),
                            Divider(),
                            DefaultTextStyle(
                              style: GoogleFonts.robotoSlab(fontSize: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    "Demande par : " +
                                        findUser(_controller
                                                .demandesFiltrie[index].user)
                                            .name,
                                    maxLines: 1,
                                  ),
                                  VerticalDivider(
                                    color: Colors.black,
                                  ),
                                  VerticalDivider(
                                    color: Colors.black,
                                  ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 6,
                      backgroundColor: Colors.green,
                    ),
                    Text('  Déja Vue'),
                    SizedBox(width: 10),
                    CircleAvatar(
                      maxRadius: 6,
                      backgroundColor: Colors.blue,
                    ),
                    Text('  Valider'),
                    SizedBox(width: 10),
                    CircleAvatar(
                      maxRadius: 6,
                      backgroundColor: Colors.red,
                    ),
                    Text('  Refuser'),
                    SizedBox(width: 10),
                    CircleAvatar(
                      maxRadius: 6,
                      backgroundColor: Colors.deepPurple,
                    ),
                    Text('  Attente'),
                    SizedBox(width: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget threeDot({bool vue, bool valide, bool refus}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CircleAvatar(
        maxRadius: 6,
        backgroundColor: vue ? Colors.green : Colors.grey,
      ),
      CircleAvatar(
        maxRadius: 6,
        backgroundColor: valide ? Colors.blue : Colors.grey,
      ),
      CircleAvatar(
        maxRadius: 6,
        backgroundColor: refus ? Colors.red : Colors.grey,
      ),
    ],
  );
}