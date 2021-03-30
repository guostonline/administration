import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.put(Controller());

class DemandeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 500,
      height: 650,
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 20,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Les demandes", style: GoogleFonts.robotoSlab(fontSize: 25)),
              TextField(
                onChanged: (value) {
                  _controller.demandesFiltrie.assignAll(_controller.demandes
                      .where((element) => element.localite
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList());
                },
                decoration:
                    InputDecoration(hintText: "Rechercher dans les demande.."),
              ),
              Obx(
                () => Container(
                  height: 600,
                  child: ListView.builder(
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
                            _controller.userName.value = findUser(
                                    _controller.demandesFiltrie[index].user)
                                .name;
                          },
                          trailing: threeDot(
                              vue: _controller.demandesFiltrie[index].vue,
                              valide:
                                  _controller.demandesFiltrie[index].valider,
                              devis:
                                  _controller.demandesFiltrie[index].repondu),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(findUser(
                                    _controller.demandesFiltrie[index].user)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      _controller.demandesFiltrie[index].desLe),
                                  Text("<"),
                                  Flexible(child: Divider(color: Colors.black)),
                                  Text(">"),
                                  Text(_controller
                                      .demandesFiltrie[index].jusqua),
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
                                    Text("Client : " +
                                        findUser(_controller
                                                .demandesFiltrie[index].user)
                                            .name),
                                    VerticalDivider(
                                      color: Colors.black,
                                    ),
                                    Text("Email : " +
                                        findUser(_controller
                                                .demandesFiltrie[index].user)
                                            .email),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget threeDot({bool vue, bool valide, bool devis}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CircleAvatar(
        maxRadius: 6,
        backgroundColor: vue ? Colors.green : Colors.grey,
      ),
      CircleAvatar(
        maxRadius: 6,
        backgroundColor: valide ? Colors.green : Colors.grey,
      ),
      CircleAvatar(
        maxRadius: 6,
        backgroundColor: devis ? Colors.green : Colors.grey,
      ),
    ],
  );
}
