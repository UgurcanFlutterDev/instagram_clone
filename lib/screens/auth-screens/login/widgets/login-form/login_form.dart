import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/features/auth-features/auth/controller/auth_controller.dart';
import 'package:instagram_clone/utils/validators.dart';
import 'package:instagram_clone/widgets/form-widgets/form-button/button.dart';
import 'package:instagram_clone/widgets/form-widgets/form-button/button_model.dart';
import 'package:instagram_clone/widgets/form-widgets/form-input/input.dart';
import 'package:instagram_clone/widgets/form-widgets/form-input/input_model.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

    return Obx(
      () => Form(
        key: loginFormKey,
        autovalidateMode: authController.isSubmitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        child: Column(
          children: [
            SizedBox(height: Get.height * .02),
            CustomInput(
              model: const InputModel(hintText: "E-Mail address"),
              keyboardType: TextInputType.emailAddress,
              validator: (email) => Validators.emailValidator(email),
              textInputAction: TextInputAction.next,
              onSaved: (value) => authController.loginModel.value.email = value,
            ),
            SizedBox(height: Get.height * .02),
            CustomInput(
              onSaved: (value) => authController.loginModel.value.password = value,
              validator: (value) => Validators.minLengthValidator(6, value),
              keyboardType: TextInputType.visiblePassword,
              model: const InputModel(
                hintText: "Password",
                isObsecured: true,
              ),
            ),
            SizedBox(height: Get.height * .02),
            CustomButton(
              isLoading: authController.isLoading,
              model: ButtonModel(
                label: "Login",
                onPressed: () {
                  authController.login(loginFormKey);
                },
              ),
            ),
            SizedBox(height: Get.height * .03),
          ],
        ),
      ),
    );
  }
}
