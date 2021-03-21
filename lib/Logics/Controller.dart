import 'package:administration/Logics/Demande.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  List<Demande> _demanad;
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

  void setDemande(List<Demande> mylist) {
    demandeCategorie.value= mylist[1].categorie;
  }
}
