import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/features/auth-features/auth/models/user_model.dart';
import 'package:instagram_clone/features/firebase-features/helpers/storage_methods.dart';
import 'package:instagram_clone/features/firebase-features/models/login_model.dart';
import 'package:instagram_clone/features/firebase-features/models/register_model.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StorageMethods _storageMethods = StorageMethods();
  //Kayıt olma

  Future<bool> signUpUser(RegisterModel model, XFile? file) async {
    try {
      final UserCredential credential = await _auth.createUserWithEmailAndPassword(email: model.email!, password: model.password!);
      final photoUrl = await _storageMethods.uploadImageToStorage("profilePics", file!, false, credential.user!.uid);
      model.photoUrl = photoUrl;
      model.uid = credential.user!.uid;

      await _firestore.collection("users").doc(credential.user!.uid).set(model.toJson());
      Get.snackbar("Registered Successfully!", "The record was created successfully.");
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Register Failed!",
        e.message ?? "Error on register!",
        backgroundColor: Colors.red.shade700.withOpacity(0.7),
      );
    }
    return false;
  }

  Future<void> login(LoginModel model) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(email: model.email!, password: model.password!);
      inspect(credential);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Login Failed!",
        e.message ?? "Error on login!",
        backgroundColor: Colors.red.shade700.withOpacity(0.7),
      );
    }
  }

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection("users").doc(currentUser.uid).get();

    return UserModel.fromSnap(snap);
  }
}
