import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShowOfficerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> ShowUser() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("employee").doc(uid).snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getOfficerData() async {
    QuerySnapshot<Map<String, dynamic>> query =
        await firestore.collection("employee").get();

    return query;
  }
}
