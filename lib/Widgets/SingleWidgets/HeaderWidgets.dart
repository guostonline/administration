import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:administration/Logics/GetDateFireBase.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.put(Controller());

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({Key key, this.myDemande}) : super(key: key);
  final Demande myDemande;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: 200,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[600],
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue[600],
                    blurRadius: 20,
                    offset: Offset(8, 16), // Shadow position
                  ),
                ],
              ),
              child: DefaultTextStyle(
                style:
                    GoogleFonts.robotoSlab(color: Colors.white, fontSize: 15),
                child: Column(
                  children: [
                    Text("Nouveau Demande",
                        style: GoogleFonts.robotoSlab(
                            color: Colors.white, fontSize: 20)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        AutoSizeText(_controller.demandesFiltrie[0].localite),
                        Flexible(child: Divider(color: Colors.white)),
                        AutoSizeText(
                            _controller.demandesFiltrie[0].destination),
                      ],
                    ),
                    Row(
                      children: [
                        AutoSizeText(_controller.demandesFiltrie[0].desLe),
                        Flexible(child: Divider(color: Colors.white)),
                        AutoSizeText(_controller.demandesFiltrie[0].jusqua),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                            backgroundImage: NetworkImage(
                                findUser(_controller.demandesFiltrie[0].user)
                                    .photoUrl)),
                        AutoSizeText(
                            findUser(_controller.demandesFiltrie[0].user).name),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
