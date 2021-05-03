import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:administration/Logics/TimesDateFunctions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.put(Controller());

class ClientInformation extends StatelessWidget {
  const ClientInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
          border: Border.all(color: Colors.blue, width: 5)),
      child: Obx(
        () => Card(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(_controller.clientPhoto.value),
                  ),
                ),
                myRow(
                  title: "Nom de client",
                  desc: _controller.clientName.value,
                ),
                myRow(
                  title: "Email",
                  desc: _controller.clientEmail.value,
                ),
                myRow(
                  title: "Téléphone",
                  desc: _controller.clientPhone.value,
                ),
                Container(
                  height: 230,
                  width: 400,
                  child: ListView.builder(
                      itemCount: _controller.demandesByClient.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: DefaultTextStyle(
                            style: GoogleFonts.robotoSlab(
                                color: Colors.black, fontSize: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_controller
                                    .demandesByClient[index].localite),
                                Flexible(
                                    child: Divider(
                                  color: Colors.white,
                                )),
                                Text(_controller
                                    .demandesByClient[index].destination),
                              ],
                            ),
                          ),
                          subtitle: DefaultTextStyle(
                            style: GoogleFonts.robotoSlab(
                                color: Colors.black, fontSize: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(convertDate(
                                    _controller.demandesByClient[index].desLe)),
                                Flexible(
                                    child: Divider(
                                  color: Colors.white,
                                )),
                                Text(convertDate(_controller
                                    .demandesByClient[index].jusqua)),
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
      ),
    );
  }
}

Widget myRow({String title, String desc}) {
  return DefaultTextStyle(
    style: GoogleFonts.robotoSlab(fontSize: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        AutoSizeText(
          desc,
          maxLines: 1,
          maxFontSize: 14,
          minFontSize: 8,
        )
      ],
    ),
  );
}
