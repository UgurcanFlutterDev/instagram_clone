import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/features/firebase-features/helpers/auth_methods.dart';
import 'package:instagram_clone/features/firebase-features/models/login_model.dart';

class AuthController extends GetxController {
  Rx<LoginModel> loginModel = Rx<LoginModel>(LoginModel());
  final FirebaseAuthMethods _firebaseAuthMethods = FirebaseAuthMethods();

  final RxBool _isSubmitted = RxBool(false);
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;

  void login(GlobalKey<FormState> formKey) async {
    _isSubmitted.value = true;
    _isLoading.value = true;
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await _firebaseAuthMethods.login(loginModel.value);
    }
    _isLoading.value = false;
  }
}
