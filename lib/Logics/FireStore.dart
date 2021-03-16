import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

FirebaseFirestore ds = FirebaseFirestore.instance;

Future saveToFireStore() async {
  await ds
      .collection("web")
      .doc()
      .set({"name": "chakib", "type": "admin"}).then(
          (value) => Get.snackbar("Information", "Message send seccsufly"));
}
