import 'package:administration/Logics/Controller.dart';
import 'package:administration/Widgets/GlobaleWidgets/SwitchWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Controller _controller = Get.find();

class BottonInformation extends StatelessWidget {
  const BottonInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MySwitcher(
                  title: "Vue",
                  color: Colors.green,
                  controller: _controller.demandeVue,
                ),
                MySwitcher(
                  title: "Valider",
                  color: Colors.blue,
                  controller: _controller.demandeValider,
                ),
                MySwitcher(
                  title: "On Cours",
                  color: Colors.purple,
                  controller: _controller.demandeRepondu,
                ),
                MySwitcher(
                  title: "Refus",
                  color: Colors.red,
                  controller: _controller.demandeRefus,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
