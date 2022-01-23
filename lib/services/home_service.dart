import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeServices {
  final CollectionReference categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference prodactColooectionRef =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProdacts() async {
    var value = await prodactColooectionRef.get();
    return value.docs;
  }
}
