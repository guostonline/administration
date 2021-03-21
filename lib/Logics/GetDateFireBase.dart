import 'package:cloud_firestore/cloud_firestore.dart';



 CollectionReference users =FirebaseFirestore.instance.collection('Users');
 CollectionReference demandes =FirebaseFirestore.instance.collection('Demandes');


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
