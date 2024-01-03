import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occured");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occured");
    }
    return null;
  }

  createUserWithEmailAndPassword(String email, String password) {}

  createUserWithEmailAnd(String email, String password) {}

  Future<String> bookMark(
      {required String title,
      required String description,
      required String price,
      required String imageUrl,
      String quantity = '1'}) async {
    String res = "error";

    String productId = const Uuid().v1();
    await FirebaseFirestore.instance.collection("cart").doc(productId).set({
      "title": title,
      "imgUrl": imageUrl,
      "description": description,
      'price': price,
      'productId': productId,
      'quantity': quantity
    });
    res = 'success';

    return res;
  }

  Future<String> newQuantity(
      {required String productId, required String quantity}) async {
    String res = 'error';

    if (productId.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(productId)
          .update({'quantity': quantity});
      res = 'success';
    }

    return res;
  }
}
