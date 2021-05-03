import 'package:administration/Logics/Controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

Controller _controller = Get.find();
FirebaseFirestore ds = FirebaseFirestore.instance;
Future saveInformationToFireStore() async {
  var myDs = ds.collection("Demandes");
  await myDs.add({
    "User": _controller.addUserID.value,
    "Date de comande": DateTime.now(),
    "Categorie": _controller.addCategorie.value,
    "Localite": _controller.addLocalite.value,
    "Destination": _controller.addDestination.value,
    "DesLe": DateTime.parse(_controller.addDateDesLe.value),
    "Jusqua": DateTime.parse(_controller.addDateJusqua.value),
    "Chargement-Dechargment": _controller.addSwitchChargeDecharge.value,
    "Montage-Demontage": _controller.addSwitchMontageDemantage.value,
    "Besoin-Embalage": _controller.addSwitchBesoinEmballage.value,
    "Nombre de salons": _controller.addNumberChambre.value,
    "Demande de Facture": _controller.addSwitchFacture.value,
    "Quantité": _controller.addNumberProduit.value,
    "Poids": _controller.addTotalPoids.value,
    "Vue": false,
    "Repondu": false,
    "Refus": false,
    "Montant": 0,
    "Valider": false
  }).then((value) => {
        myDs.doc(value.id).update({"ID": value.id}),
      });
}

Future updateDataToFireStore(String doc, data) async {
  await ds.collection("Demandes").doc(doc).update(data);
}

Future deleteDemandeFromFireStore(String docID) async {
  await ds.collection('Demandes').doc(docID).delete();
}
