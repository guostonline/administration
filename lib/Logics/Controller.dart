import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:administration/Logics/TimesDateFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // Demande demanad;
  RxList simpleList = [].obs;
  RxList myList = [].obs;
  RxList listOfThisDay = [].obs;
  RxList justAdded = [].obs;

  RxList demandesFiltrie = [].obs;
  RxList demandes = [].obs;
  RxList demandesDejour = [].obs;
  RxList userList = [].obs;
  RxList demandeList = [].obs;
  List<Demande> oneDemand = [];

  String userId = "";
  String demandeID = "";
  RxString userName = "".obs;
  RxString userEmail = "".obs;
  RxString userPhone = "".obs;
  RxString userPhotoUrl = "".obs;
  RxString demandeCategorie = "".obs;
  RxString demandeLocalite = "".obs;
  RxString demandeDestination = "".obs;
  RxString demandeDesLe = "".obs;
  RxString demandeJusqua = "".obs;
  RxBool demandeChargeDecharge = false.obs;
  RxBool demandeCMontageDemontage = false.obs;
  RxBool demandeBesoinEmbalage = false.obs;
  RxBool demandeAvecFacture = false.obs;
  RxBool demandeValider = false.obs;
  RxBool demandeRepondu = false.obs;
  RxBool demandeVue = false.obs;
  RxBool demandeRefus = false.obs;

  RxInt numberSalon = 0.obs;
  RxInt numberProduit = 0.obs;
  RxInt totlaPoids = 0.obs;
//Switcher
  RxBool filterValidees = false.obs;
  RxBool filterOnAttends = false.obs;
  RxBool filterRefusees = false.obs;
  RxBool filterDejaVue = false.obs;

  //add Demande
  RxString addCategorie = "Adeel Déménagement".obs;
  RxString addDateDesLe = "".obs;
  RxString addDateJusqua = "".obs;
  RxString addLocalite = "".obs;
  RxString addDestination = "".obs;
  RxInt addNumberChambre = 0.obs;
  RxInt addNumberProduit = 0.obs;
  RxInt addTotalPoids = 0.obs;
  RxBool addSwitchChargeDecharge = false.obs;
  RxBool addSwitchMontageDemantage = false.obs;
  RxBool addSwitchBesoinEmballage = false.obs;
  RxBool addSwitchFacture = false.obs;
  RxString addUserID = "".obs;
  RxString addUserName = "Select un client".obs;
  RxString addUserEmail = "".obs;

  RxString categorieImage = "images/demenagement.jpg".obs;
  RxBool isVisible = true.obs;

  void setDemande(Demande mydemandeList) {
    demandeID = mydemandeList.id;
    demandeValider.value = mydemandeList.valider;
    demandeVue.value = mydemandeList.vue;
    demandeRepondu.value = mydemandeList.repondu;
    demandeRefus.value = mydemandeList.refus;
    demandeCategorie.value = mydemandeList.categorie;
    demandeLocalite.value = mydemandeList.localite;
    demandeDestination.value = mydemandeList.destination;
    demandeDesLe.value = convertDate(mydemandeList.desLe);
    demandeJusqua.value = convertDate(mydemandeList.jusqua);
    userEmail.value = findUser(mydemandeList.user).email;
    userPhone.value = findUser(mydemandeList.user).numberPhone;
    userPhotoUrl.value = findUser(mydemandeList.user).photoUrl;
    demandeChargeDecharge.value = mydemandeList.chargeDecharge;
    demandeCMontageDemontage.value = mydemandeList.montageDemontage;
    demandeBesoinEmbalage.value = mydemandeList.besoiEmballage;
    demandeAvecFacture.value = mydemandeList.demnadeDeFacture;
    numberSalon.value = mydemandeList.nombreDeSalon ?? 0;
    numberProduit.value = mydemandeList.quantite ?? 0;
    totlaPoids.value = mydemandeList.poids ?? 0;
  }

 
}
