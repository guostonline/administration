import 'package:administration/Logics/Controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Controller _controller = Get.find();
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
      // var test = DateFormat("dd/MM/yyyy").format(picked);
      _controller.addDateDesLe.value = picked.toString();
    } else if (isJusqua) {
      //var test = DateFormat("dd/MM/yyyy").format(picked);
      _controller.addDateJusqua.value = picked.toString();
    }
  }
}

String convertDate(Timestamp date) {
  var formattedDate = DateFormat("dd/MM/yyyy").format(date.toDate());

  return formattedDate;
}

String convertPickedToString(String date) {
  if (date.isEmpty) return "";
  DateTime dateTime = DateTime.tryParse(date);
  var formatDate = DateFormat("dd/MM/yyyy").format(dateTime);
  print(formatDate);
  return formatDate;
}

extension TimeStampToString on Timestamp {
  String convertDate() {
    return formattedDate = DateFormat("dd/MM/yyyy").format(this.toDate());
  }
}
