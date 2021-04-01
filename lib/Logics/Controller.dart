import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/FilterFunctions.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // Demande demanad;
  RxList simpleList = [].obs;
  RxList myList = [].obs;
  RxList demandesFiltrie = [].obs;
  RxList demandes = [].obs;
  RxList userList = [].obs;
  RxList demandeList = [].obs;
  List<Demande> oneDemand = [];

  String userId = "";
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

  RxInt numberSalon = 0.obs;
  RxInt numberProduit = 0.obs;
  RxInt totlaPoids = 0.obs;
//Switcher
  RxBool filterValidees = false.obs;
  RxBool filterOnAttends = false.obs;
  RxBool filterRefusees = false.obs;
  RxBool filterDejaVue = false.obs;

  RxBool isVisible = false.obs;

  void setDemande(Demande mydemandeList) {
    demandeCategorie.value = mydemandeList.categorie;
    demandeLocalite.value = mydemandeList.localite;
    demandeDestination.value = mydemandeList.destination;
    demandeDesLe.value = mydemandeList.desLe;
    demandeJusqua.value = mydemandeList.jusqua;
    userId = mydemandeList.user;
    userName.value = findUser(userId).name;
    userEmail.value = findUser(userId).email;
    userPhone.value = findUser(userId).numberPhone;
    userPhotoUrl.value = findUser(userId).photoUrl;
    demandeChargeDecharge.value = mydemandeList.chargeDecharge;
    demandeCMontageDemontage.value = mydemandeList.montageDemontage;
    demandeBesoinEmbalage.value = mydemandeList.besoiEmballage;
    demandeAvecFacture.value = mydemandeList.demnadeDeFacture;
  }
}
