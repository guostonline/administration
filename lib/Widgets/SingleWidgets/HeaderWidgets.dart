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
              width: 250,
              height: 223,
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
                      GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),
                  child: Column(
                    children: [
                      Text("New Demandes"),
                      Container(
                        height: 160,
                        width: 250,
                        child: ListView.builder(
                            itemCount: _controller.justAdded.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(findUser(
                                          _controller.justAdded[index].user)
                                      .photoUrl),
                                ),
                                title: DefaultTextStyle(
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.white, fontSize: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(_controller
                                          .justAdded[index].localite),
                                      Flexible(
                                          child: Divider(
                                        color: Colors.white,
                                        indent: 2,
                                        endIndent: 2,
                                      )),
                                      Text(_controller
                                          .justAdded[index].destination),
                                    ],
                                  ),
                                ),
                                subtitle: DefaultTextStyle(
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.white, fontSize: 10),
                                  child: Row(
                                    children: [
                                      Text(convertDate(
                                          _controller.justAdded[index].desLe)),
                                      Flexible(
                                          child: Divider(
                                        color: Colors.white,
                                        indent: 2,
                                        endIndent: 2,
                                      )),
                                      Text(convertDate(
                                          _controller.justAdded[index].jusqua)),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  )),
            ),
            Container(
              padding: EdgeInsets.all(5),
              width: 250,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orange,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.shade200,
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
                            color: Colors.white, fontSize: 20)),
                    Container(
                      width: 250,
                      height: 160,
                      child: ListView.builder(
                        itemCount: _controller.listOfThisDay.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: DefaultTextStyle(
                              style:
                                  GoogleFonts.robotoSlab(color: Colors.white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(_controller
                                      .listOfThisDay[index].localite),
                                  Flexible(
                                      child: Divider(
                                    color: Colors.white,
                                    endIndent: 2,
                                    indent: 2,
                                  )),
                                  Text(_controller
                                      .listOfThisDay[index].destination),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
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
