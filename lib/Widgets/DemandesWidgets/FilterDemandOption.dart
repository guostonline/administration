import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Controller _controller = Get.find();

class FilterDemandeOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.robotoSlab(fontSize: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text("Déja vue "),
            FlutterSwitch(
              activeColor: Colors.green,
              height: 30,
              width: 45,
              value: _controller.filterDejaVue.value,
              onToggle: (value) {
                resetAllSwitcher();

                filterByVue(value);
                _controller.filterDejaVue.value = value;
              },
            ),
            SizedBox(width: 8),
            Text("Valider "),
            FlutterSwitch(
              activeColor: Colors.blue,
              height: 30,
              width: 45,
              value: _controller.filterValidees.value,
              onToggle: (value) {
                resetAllSwitcher();

                filterByValide(value);
                _controller.filterValidees.value = value;
              },
            ),
            SizedBox(width: 8),
            Text("En attente "),
            FlutterSwitch(
              activeColor: Colors.purple,
              height: 30,
              width: 45,
              value: _controller.filterOnAttends.value,
              onToggle: (value) {
                resetAllSwitcher();

                filterByAttend(value);
                _controller.filterOnAttends.value = value;
              },
            ),
            SizedBox(width: 8),
            Text("Refus "),
            FlutterSwitch(
              activeColor: Colors.red,
              height: 30,
              width: 45,
              value: _controller.filterRefusees.value,
              onToggle: (value) {
                resetAllSwitcher();
                filterByRefus(value);
                _controller.filterRefusees.value = value;
              },
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
