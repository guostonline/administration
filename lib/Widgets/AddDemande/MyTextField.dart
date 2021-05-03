import 'package:administration/Logics/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


  Controller _controller = Get.find();

class MyTextFields extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 9,
              child: Text("Nomber de salons"),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    _controller.addNumberChambre.value = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 9,
              child: Text("Nomber de Produits"),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    if (value.isNum)
                      _controller.addNumberProduit.value = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 9,
              child: Text("Total poids"),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    if (value.isNum)
                      _controller.addTotalPoids.value = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixText: "Kg",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
