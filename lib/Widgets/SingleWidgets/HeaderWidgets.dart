import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:administration/Logics/TimesDateFunctions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.put(Controller());
DateTime dateNow = DateTime.now();

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({Key key, this.myDemande}) : super(key: key);
  final Demande myDemande;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
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
                child: InkWell(
                  onTap: () {
                    //_controller.setDemande(demande[index]);

                    _controller.isVisible.value = true;
                    _controller.setDemande(_controller.demandes[0]);
                    _controller.userName.value =
                        findUser(_controller.demandes[0].user).name;
                  },
                  child: Column(
                    children: [
                      Text("Nouveau Demande",
                          style: GoogleFonts.robotoSlab(
                              color: Colors.yellow, fontSize: 20)),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          AutoSizeText(_controller.demandes[0].localite),
                          Flexible(child: Divider(color: Colors.white)),
                          AutoSizeText(_controller.demandes[0].destination),
                        ],
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                              convertDate(_controller.demandes[0].desLe)),
                          Flexible(child: Divider(color: Colors.white)),
                          AutoSizeText(
                              convertDate(_controller.demandes[0].jusqua)),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  findUser(_controller.demandes[0].user)
                                      .photoUrl)),
                          AutoSizeText(
                              findUser(_controller.demandes[0].user).name),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                    Text("Demandes d'aujourd'hui",
                        style: GoogleFonts.robotoSlab(
                            color: Colors.yellow, fontSize: 20)),
                    Container(
                      height: 200,
                      width: 300,
                      child: ListView.builder(
                          itemCount: 3,
                           itemBuilder: (BuildContext context, int index) { 
                            return ListTile(

                            );
                           },),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
