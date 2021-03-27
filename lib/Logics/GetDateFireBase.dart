import 'package:administration/Logics/Controller.dart';
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

getOneUser(String userID) async {
  try {
    var test = await users.doc(userID).get();
    _controller.setUser(test.data());
    // print(test.data());
    return test.data();
  } catch (e) {
    print(e.message);
  }
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
