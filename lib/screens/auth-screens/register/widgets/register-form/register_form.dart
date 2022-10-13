import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/features/firebase-features/controller/firebase-form-controller/firebase_form_controller.dart';
import 'package:instagram_clone/services/color_service.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/utils/validators.dart';
import 'package:instagram_clone/widgets/form-widgets/form-button/button.dart';
import 'package:instagram_clone/widgets/form-widgets/form-button/button_model.dart';
import 'package:instagram_clone/widgets/form-widgets/form-input/input.dart';
import 'package:instagram_clone/widgets/form-widgets/form-input/input_model.dart';

import 'widgets/register_form_bottom_sheet.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFormController formController = Get.find();
    return Obx(
      () => Form(
        key: formController.formKey,
        autovalidateMode: formController.isFormSubmitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: formController.registerPhoto.value == null
                        ? const Image(
                            image: AssetImage("assets/images/no_photo.png"),
                            fit: BoxFit.fill,
                          )
                        : FutureBuilder<Uint8List>(
                            future: formController.registerPhoto.value!.readAsBytes(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return SizedBox();
                              }
                              return Image(
                                image: MemoryImage(snapshot.data!),
                                fit: BoxFit.fill,
                              );
                            }),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () async {
                        Get.bottomSheet(
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RegisterBottomSheetItem(
                                icon: Icons.camera_alt_rounded,
                                title: "From camera",
                                onTap: () async {
                                  final data = await Utils.pickImage(ImageSource.camera);
                                  formController.registerPhoto.value = data;
                                },
                              ),
                              Divider(
                                thickness: 0.7,
                                color: ColorService.gray,
                              ),
                              RegisterBottomSheetItem(
                                icon: Icons.photo,
                                title: "From gallery",
                                onTap: () async {
                                  final data = await Utils.pickImage(ImageSource.gallery);
                                  formController.registerPhoto.value = data;
                                },
                              ),
                            ],
                          ),
                          isScrollControlled: false,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          backgroundColor: Colors.white,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: Get.height * .03),
            CustomInput(
              model: const InputModel(hintText: "Username"),
              onSaved: (value) => formController.registerModel.value.userName = value,
              textInputAction: TextInputAction.next,
              validator: (value) => Validators.minLengthValidator(5, value),
            ),
            SizedBox(height: Get.height * .02),
            CustomInput(
              onSaved: (value) => formController.registerModel.value.email = value,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              model: const InputModel(hintText: "E-Mail"),
              validator: (value) => Validators.emailValidator(value),
            ),
            SizedBox(height: Get.height * .02),
            CustomInput(
              model: const InputModel(hintText: "Password", isObsecured: true),
              keyboardType: TextInputType.visiblePassword,
              onSaved: (value) => formController.registerModel.value.password = value,
              onFieldSubmitted: (val) => FocusScope.of(context).nextFocus(),
              textInputAction: TextInputAction.next,
              validator: (value) => Validators.minLengthValidator(6, value),
            ),
            SizedBox(height: Get.height * .02),
            CustomInput(
              onSaved: (value) => formController.registerModel.value.bio = value,
              model: const InputModel(hintText: "Bio"),
              validator: (value) => Validators.minLengthValidator(5, value),
            ),
            SizedBox(height: Get.height * .03),
            CustomButton(
              isLoading: formController.isButtonLoading,
              model: ButtonModel(
                label: "Register",
                onPressed: () {
                  formController.saveForm();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
