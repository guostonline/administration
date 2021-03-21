import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientsWidget extends StatelessWidget {
  const ClientsWidget({Key key, @required this.clientsList}) : super(key: key);
  final List clientsList;
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
              Flexible(
                child: Container(
                  child: ListView.builder(
                      itemCount: clientsList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(clientsList[index].name),
                          subtitle: Text(clientsList[index].email),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(clientsList[index].photoUrl),
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
