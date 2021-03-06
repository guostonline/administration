import 'package:administration/Logics/FilterFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MySwitcher extends StatelessWidget {
  String title;
  RxBool controller;
  Color color;
  MySwitcher({
    @required this.title,
    @required this.color,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        SizedBox(width: 5),
        FlutterSwitch(
          activeColor: color,
          height: 30,
          width: 45,
          value: controller.value,
          onToggle: (value) {
            resetAllSwitcher();
            controller.value = value;
          },
        ),
      ],
    );
  }
}
