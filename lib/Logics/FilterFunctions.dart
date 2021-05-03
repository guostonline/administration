import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'Controller.dart';
import 'User.dart';

Controller _controller = Get.put(Controller());

User findUser(String uid) =>
    _controller.myList.firstWhere((list) => list.id == uid);

String selectCategorieImage(String categorie) {
  switch (categorie) {
    case "Adeel Déménagement":
      return "images/demenagement.jpg";
      break;
    case "Bagages":
      return "images/bagage.png";
      break;
    case "Transport de Marchandises":
      return "images/carton.png";
      break;
    case "Meuble, élétroménager":
      return "images/meuble.png";
      break;
    case "Palettes":
      return "images/palette.png";
      break;
    case "Livraison Express des Colis":
      return "images/coli.png";
      break;

    default:
      return "images/demenagement.jpg";
  }
}

filterByValide(bool option) {
  if (option)
    _controller.demandesFiltrie.assignAll(_controller.demandes
        .where((demande) => demande.valider == true)
        .toList());
  else
    _controller.demandesFiltrie.assignAll(_controller.demandes);
}

filterByVue(bool option) {
  if (option)
    _controller.demandesFiltrie.assignAll(
        _controller.demandes.where((demande) => demande.vue == true).toList());
  else
    _controller.demandesFiltrie.assignAll(_controller.demandes);
}

filterByRefus(bool option) {
  if (option)
    _controller.demandesFiltrie.assignAll(_controller.demandes
        .where((demande) => demande.refus == true)
        .toList());
  else
    _controller.demandesFiltrie.assignAll(_controller.demandes);
}

filterByAttend(bool option) {
  if (option)
    _controller.demandesFiltrie.assignAll(_controller.demandes
        .where((demande) => demande.repondu == true)
        .toList());
  else
    _controller.demandesFiltrie.assignAll(_controller.demandes);
}

filterByClient() {
  _controller.demandesByClient.assignAll(_controller.demandes
      .where((demande) => demande.user == _controller.clientID.value)
      .toList());
}

List filterByThisDay(DateTime dateNow, List demande) {
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateNow);
  return demande.where((demande) => demande.desLe == formattedDate).toList();
}

List listOfDays(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }

  return days;
}

bool compareDate(DateTime now, List myList) {
  String formatedDate = DateFormat("yyyy/MM/dd").format(now);
  bool test = myList.any(
      (element) => DateFormat("yyyy/MM/dd").format(element) == formatedDate);
  print(test);
  return test;
}

bool compareDateDeDemande(DateTime timestamp) {
  var date = DateFormat("yyyy/MM/dd").format(timestamp);
  var dateNow = DateFormat("yyyy/MM/dd").format(DateTime.now());
  if (date == dateNow) return true;
  return false;
}

filterBythisDay() {
  List numberDays = [];
  List finalList = [];
  for (int i = 0; i < _controller.demandes.length; i++) {
    numberDays.addAll(listOfDays(_controller.demandes[i].desLe.toDate(),
        _controller.demandes[i].jusqua.toDate()));
    bool testIfTrue = compareDate(DateTime.now(), numberDays);
    finalList.addIf(testIfTrue == true, _controller.demandes[i]);
  }
  print(finalList);
  _controller.listOfThisDay.assignAll(finalList);
}

justAdded() {
  List justAdded = [];
  for (int i = 0; i < _controller.demandes.length; i++) {
    justAdded.addIf(
        compareDateDeDemande(_controller.demandes[i].dateDeComande.toDate()) ==
            true,
        _controller.demandes[i]);
  }
  _controller.justAdded.assignAll(justAdded);
}

resetAllSwitcher() {
  _controller.filterDejaVue.value = false;
  _controller.filterOnAttends.value = false;
  _controller.filterRefusees.value = false;
  _controller.filterValidees.value = false;
}

Color statCircle({bool valider, bool vue, bool attent, bool refus}) {
  if (vue) return Colors.green;
  if (valider) return Colors.blue;
  if (attent) return Colors.purple;
  if (refus) return Colors.red;
  return Colors.grey;
}
