import 'package:administration/Logics/Demande.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // Demande demanad;
  RxList simpleList = [].obs;
  RxList myList = [].obs;

  RxString userName = "".obs;
  RxString userEmailm = "".obs;
  RxString userPhone = "".obs;
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

  void setDemande(Demande mydemandeList) {
    demandeCategorie.value = mydemandeList.categorie;
    demandeLocalite.value = mydemandeList.localite;
    demandeDestination.value = mydemandeList.destination;
    demandeDesLe.value = mydemandeList.desLe;
    demandeJusqua.value = mydemandeList.jusqua;
  }

  setUser(oneUser) {
    if (oneUser["Nom et prenom"] == null) userName.value = "no user";
    userName.value = oneUser["Nom et prenom"];
  }

  void filtredList(RxList mylist) {
    simpleList = mylist;
  }

  filterUser(String userID){
var test =myList.where((element) => 
  element
);
  }
}
