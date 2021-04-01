import 'package:cloud_firestore/cloud_firestore.dart';

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
