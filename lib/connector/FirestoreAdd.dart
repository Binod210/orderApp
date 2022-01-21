import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String name, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  String uid = FirebaseAuth.instance.currentUser!.uid;
  DocumentReference doc = users.doc(uid);
  doc.set(
    {'name': name, 'email': email, 'uid': uid},
  );
  return;
}
