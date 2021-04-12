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
      width: 350,
      height: 600,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 300,
              width: 300,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 280,
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade200,
                            blurRadius: 20,
                            offset: Offset(8, 16), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text("Nouveau Demandes",
                              style: GoogleFonts.robotoSlab(
                                  fontSize: 20, color: Colors.white)),
                          Container(
                            width: 250,
                            height: 250,
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
                                          color: Colors.white, fontSize: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(_controller
                                              .justAdded[index].localite),
                                          Flexible(
                                              child: Divider(
                                            color: Colors.white,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(convertDate(_controller
                                              .justAdded[index].desLe)),
                                          Flexible(
                                              child: Divider(
                                            color: Colors.white,
                                          )),
                                          Text(convertDate(_controller
                                              .justAdded[index].jusqua)),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        child: Text(_controller.justAdded.length.toString()),
                      ))
                ],
              ),
            ),
            Container(
              height: 300,
              width: 300,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 280,
                      width: 260,
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
                      child: Column(
                        children: [
                          Text("Demandes aujourd'hui",
                              style: GoogleFonts.robotoSlab(
                                  fontSize: 20, color: Colors.white)),
                          Container(
                            width: 250,
                            height: 250,
                            child: ListView.builder(
                                itemCount: _controller.listOfThisDay.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(findUser(
                                              _controller
                                                  .listOfThisDay[index].user)
                                          .photoUrl),
                                    ),
                                    title: DefaultTextStyle(
                                      style: GoogleFonts.robotoSlab(
                                          color: Colors.white, fontSize: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(_controller
                                              .listOfThisDay[index].localite),
                                          Flexible(
                                              child: Divider(
                                            color: Colors.white,
                                          )),
                                          Text(_controller.listOfThisDay[index]
                                              .destination),
                                        ],
                                      ),
                                    ),
                                    subtitle: DefaultTextStyle(
                                      style: GoogleFonts.robotoSlab(
                                          color: Colors.white, fontSize: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(convertDate(_controller
                                              .listOfThisDay[index].desLe)),
                                          Flexible(
                                              child: Divider(
                                            color: Colors.white,
                                          )),
                                          Text(convertDate(_controller
                                              .listOfThisDay[index].jusqua)),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffffcc29),
                        child: Text(
                          _controller.listOfThisDay.length.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
