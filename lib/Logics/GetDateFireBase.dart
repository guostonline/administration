import 'package:cloud_firestore/cloud_firestore.dart';

Stream collectionStream =
    FirebaseFirestore.instance.collection('Users').snapshots();
Stream documentStream =
    FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

final CollectionReference myCollection =
    FirebaseFirestore.instance.collection('Users');
Stream<QuerySnapshot> getUserList({int offset, int limit}) {
  Stream<QuerySnapshot> snapshots = myCollection.snapshots();

  if (offset != null) {
    snapshots = snapshots.skip(offset);
  }
  if (limit != null) {
    snapshots = snapshots.take(limit);
  }
  return snapshots;
}
