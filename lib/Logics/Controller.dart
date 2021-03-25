import 'package:administration/Logics/Demande.dart';
import 'package:administration/Logics/User.dart';
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

  void setDemande(Demande demande) {
    demandeCategorie.value = demande.categorie;
    demandeLocalite.value = demande.localite;
    demandeDestination.value = demande.destination;
  }

  void filtredList(RxList mylist) {
    simpleList = mylist;
  }
}
