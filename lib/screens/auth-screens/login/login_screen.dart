import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/screens/auth-screens/login/widgets/bottom-navigation-bar/bottom_navigation_bar.dart';
import 'package:instagram_clone/screens/auth-screens/login/widgets/login-divider/login_divider.dart';
import 'package:instagram_clone/screens/auth-screens/login/widgets/login-form/login_form.dart';
import 'package:instagram_clone/screens/auth-screens/login/widgets/login-helper/login_helper.dart';
import 'package:instagram_clone/screens/auth-screens/login/widgets/login-with-facebook-button/login_with_facebook_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: LoginScreenBottomNavigationBar(
        buttonText: "Register",
        description: "Don't have an account ? ",
        onTap: () => Get.toNamed("/register"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: const AssetImage("assets/logo/white_text.png"), width: Get.width * .5),
              const LoginForm(),
              const LoginHelper(),
              SizedBox(height: Get.height * .015),
              const LoginDivider(),
              SizedBox(height: Get.height * .02),
              const LoginWithFacebookButton()
            ],
          ),
        ),
      ),
    );
  }
}
