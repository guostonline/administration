import 'package:administration/Logics/Controller.dart';
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
