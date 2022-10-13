import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/features/firebase-features/helpers/auth_methods.dart';
import 'package:instagram_clone/features/firebase-features/models/register_model.dart';

class FirebaseFormController extends GetxController {
  Rx<RegisterModel> registerModel = Rx<RegisterModel>(RegisterModel());

  Rxn<XFile> registerPhoto = Rxn<XFile>();

  final RxBool _isFormSubmitted = RxBool(false);
  bool get isFormSubmitted => _isFormSubmitted.value;

  final RxBool _isButtonLoading = RxBool(false);
  bool get isButtonLoading => _isButtonLoading.value;

  final Rx<GlobalKey<FormState>> _formKey = Rx<GlobalKey<FormState>>(GlobalKey<FormState>());
  GlobalKey<FormState> get formKey => _formKey.value;

  final FirebaseAuthMethods _firebaseAuthMethods = FirebaseAuthMethods();
  void saveForm() async {
    _isFormSubmitted.value = true;
    _isButtonLoading.value = true;
    if (_formKey.value.currentState!.validate() && registerPhoto.value != null) {
      _formKey.value.currentState!.save();
      final resp = await _firebaseAuthMethods.signUpUser(registerModel.value, registerPhoto.value);
      if (resp) {
        Get.close(1);
      }
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

    }
    _isButtonLoading.value = false;
  }
}
