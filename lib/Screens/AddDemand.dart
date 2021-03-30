import 'package:flutter/material.dart';

class AddDemand extends StatelessWidget {
  const AddDemand({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          child: Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Localité",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Déstination",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Dé le ",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Jusqu'a",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
