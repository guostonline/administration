import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Demande.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
