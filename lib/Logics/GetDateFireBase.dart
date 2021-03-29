import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

Controller _controller = Get.put(Controller());
CollectionReference users = FirebaseFirestore.instance.collection('Users');
CollectionReference demandes =
    FirebaseFirestore.instance.collection('Demandes');

Stream<QuerySnapshot> getUserList({int offset, int limit}) {
  Stream<QuerySnapshot> snapshots = users.snapshots();

  if (offset != null) {
    snapshots = snapshots.skip(offset);
  }
  if (limit != null) {
    snapshots = snapshots.take(limit);
  }
  return snapshots;
}

Future getOneUser(String userID) async {

    var test = await users.doc(userID).get();
    _controller.setUser(test.data());
    //print(test.data());
    return test.data()["Email"];
 
}
Future getOneUserX(String userID) async {



}


Stream<QuerySnapshot> getDemandesList({int offset, int limit}) {
  Stream<QuerySnapshot> snapshots = demandes.snapshots();

  if (offset != null) {
    snapshots = snapshots.skip(offset);
  }
  if (limit != null) {
    snapshots = snapshots.take(limit);
  }
  return snapshots;
}

Stream<QuerySnapshot> getUserBySearch(
    {String userName, int offset, int limit}) {
  Stream<QuerySnapshot> snapshots =
      users.where("Nom et prenom", isEqualTo: userName).snapshots();

  if (offset != null) {
    snapshots = snapshots.skip(offset);
  }
  if (limit != null) {
    snapshots = snapshots.take(limit);
  }
  return snapshots;
}

Future getSpecificeDemande(String userID) async {
  demandes.where("User", isEqualTo: userID).get().then((value) {
    value.docs.forEach((element) {
      return element.data();
    });
  });
}
