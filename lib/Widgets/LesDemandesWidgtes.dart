import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DomandeWidget extends StatelessWidget {
  const DomandeWidget({Key key, @required this.demandesList}) : super(key: key);
  final List demandesList;
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      elevation: 20,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
              border: Border.all(color: Colors.redAccent, width: 5)),
          width: _width / 3,
          height: 400,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.redAccent,
                child: Text("Les demandes",
                    style: GoogleFonts.abel(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                      itemCount: demandesList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          child: InkWell(
                            onTap: () {},
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.redAccent,
                              ),
                              title: Text(demandesList[index].categorie),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(demandesList[index].localite),
                                  Expanded(
                                      child: VerticalDivider(
                                    color: Colors.black,
                                  )),
                                  Text(demandesList[index].destination),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          )),
    );
  }
}
