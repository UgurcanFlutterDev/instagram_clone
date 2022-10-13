import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/features/firebase-features/controller/firebase-form-controller/firebase_form_controller.dart';
import 'package:instagram_clone/screens/auth-screens/login/login_screen.dart';
import 'package:instagram_clone/screens/auth-screens/login/widgets/bottom-navigation-bar/bottom_navigation_bar.dart';
import 'package:instagram_clone/screens/auth-screens/register/widgets/register-form/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFormController controller = Get.find();
    return Scaffold(
      bottomNavigationBar: LoginScreenBottomNavigationBar(
        buttonText: "Login",
        description: "Do you have account ? ",
        onTap: () => Get.offAll(() => const LoginPage()),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: const AssetImage("assets/logo/white_text.png"), width: Get.width * .5),
                    SizedBox(height: Get.height * .05),
                    const RegisterForm(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
