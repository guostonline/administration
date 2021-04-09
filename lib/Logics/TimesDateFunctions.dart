import 'package:administration/Logics/Controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Controller _controller = Get.put(Controller());
DateTime selectedDate = DateTime.now();
String formattedDate;
DateTime picked;
void selectDate(BuildContext context, {bool isJusqua = false}) async {
  picked = await showDatePicker(
    context: context,
    initialDate: selectedDate, // Refer step 1
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );
  if (picked != null && picked != selectedDate) {
    if (!isJusqua) {
      var test = DateFormat().format(picked);
      _controller.addDateDesLe.value = test;
    } else if (isJusqua) {
      var test = DateFormat().format(picked);
      _controller.addDateJusqua.value = test;
    }
  }
}

String convertDate(Timestamp date) {
  var formattedDate = DateFormat("dd/MM/yyyy").format(date.toDate());

  return formattedDate;
}

String convertPickedToString(String date) {
  if (date.isEmpty) return "";
  var test = DateFormat().parse(date);

  return DateFormat("dd/MM/yyyy").format(test);
}
