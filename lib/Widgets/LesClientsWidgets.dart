import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/GetDateFireBase.dart';
import 'package:administration/Logics/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.put(Controller());

class ClientsWidget extends StatelessWidget {
  const ClientsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      elevation: 20,
      child: Obx(
        () => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                border: Border.all(color: Colors.blue, width: 5)),
            width: _width / 3,
            height: 400,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Text("Mes Clients",
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22)),
                ),
                TextField(
                  onChanged: (value) {
                    _controller.simpleList.assignAll(_controller.myList
                        .where((element) => element.name
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList());
                  },
                ),
                Flexible(
                  child: Container(
                    child: ListView.builder(
                        itemCount: _controller.simpleList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            isThreeLine: true,
                            title: Text(_controller.simpleList[index].name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_controller.simpleList[index].email),
                                Text(_controller.simpleList[index].numberPhone),
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  _controller.simpleList[index].photoUrl),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
