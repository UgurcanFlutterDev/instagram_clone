import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:instagram_clone/features/auth-features/auth/controller/auth_controller.dart';
import 'package:instagram_clone/features/firebase-features/controller/firebase-form-controller/firebase_form_controller.dart';
import 'package:instagram_clone/screens/auth-screens/login/login_screen.dart';
import 'package:instagram_clone/screens/auth-screens/register/register_screen.dart';

class Routes {
  static List<GetPage<dynamic>>? getRoutes = [
    GetPage(
      name: "/",
      page: () => LoginPage(),
    ),
    GetPage(
      name: "/register",
      page: () => RegisterScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => FirebaseFormController());
      }),
    ),
  ];
}
