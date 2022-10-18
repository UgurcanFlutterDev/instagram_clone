import 'package:get/get.dart';
import 'package:instagram_clone/features/app-features/shared/controller/shared_controller.dart';
import 'package:instagram_clone/features/firebase-features/controller/firebase-form-controller/firebase_form_controller.dart';
import 'package:instagram_clone/main.dart';
import 'package:instagram_clone/screens/app-screens/main.dart';
import 'package:instagram_clone/screens/auth-screens/login/login_screen.dart';
import 'package:instagram_clone/screens/auth-screens/register/register_screen.dart';

class Routes {
  static List<GetPage<dynamic>>? getRoutes = [
    GetPage(
      name: "/",
      page: () => const LoginPage(),
    ),
    GetPage(
      name: "/home",
      page: () => const AppMain(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SharedController());
      }),
    ),
    GetPage(
      name: "/register",
      page: () => const RegisterScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => FirebaseFormController());
      }),
    ),
  ];
}
