import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/features/app-features/shared/controller/shared_controller.dart';
import 'package:instagram_clone/features/auth-features/auth/models/user_model.dart';
import 'package:instagram_clone/features/firebase-features/helpers/auth_methods.dart';
import 'package:instagram_clone/resources/resources.dart';
import 'package:instagram_clone/screens/app-screens/favories/favorites_screen.dart';
import 'package:instagram_clone/screens/app-screens/home/home_screen.dart';
import 'package:instagram_clone/screens/app-screens/home/widgets/app-bar/action_item.dart';
import 'package:instagram_clone/screens/app-screens/profile/profile_screen.dart';
import 'package:instagram_clone/screens/app-screens/reels/reels_screen.dart';
import 'package:instagram_clone/screens/app-screens/search/search_screen.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedController sharedController = Get.put(SharedController());
    final screens = [
      HomeScreen(),
      SearchScreen(),
      ReelsScreen(),
      FavoriesScreen(),
      ProfileScreen(),
    ];
    return Obx(
      (() => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Image(
                  image: AssetImage(LogoSource.whiteText2),
                ),
              ),
              leadingWidth: Get.width * .4,
              actions: const [
                AppBarActionItem(icon: SvgSource.addButtonOutlined),
                AppBarActionItem(icon: SvgSource.heartOutlined),
                AppBarActionItem(icon: SvgSource.messageButtonOutlined),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topLeft,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - kToolbarHeight - 60 - MediaQuery.of(context).padding.top,
                ),
                width: Get.width,
                child: screens[sharedController.currentPageIndex],
              ),
            ),
            bottomNavigationBar: Container(
              height: 60,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: Colors.grey.shade800,
                ),
              )),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: sharedController.currentPageIndex,
                onTap: (value) => sharedController.changeCurrentPage(value),
                showSelectedLabels: false,
                backgroundColor: Colors.black,
                showUnselectedLabels: false,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: "",
                    icon: SvgPicture.asset(
                      sharedController.currentPageIndex == 0 ? SvgSource.homeFilled : SvgSource.homeOutlined,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: SvgPicture.asset(
                      SvgSource.searchOutlined,
                      width: 26,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: SvgPicture.asset(
                      SvgSource.reels,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: SvgPicture.asset(
                      sharedController.currentPageIndex == 3 ? SvgSource.heartFilled : SvgSource.heartOutlined,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: FutureBuilder<UserModel>(
                        future: FirebaseAuthMethods().getUserDetails(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              height: 25,
                              width: 25,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image(
                                image: NetworkImage(snapshot.data!.photoUrl!),
                                fit: BoxFit.cover,
                              ),
                            );
                          }
                          return const SizedBox();
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: Colors.black,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Image(
            image: AssetImage(LogoSource.whiteText2),
          ),
        ),
        leadingWidth: Get.width * .4,
        actions: const [
          AppBarActionItem(icon: SvgSource.addButtonOutlined),
          AppBarActionItem(icon: SvgSource.heartOutlined),
          AppBarActionItem(icon: SvgSource.messageButtonOutlined),
        ],
      );

  Obx _buildBottomNavBar(SharedController sharedController) {
    return Obx(
      (() => Container(
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(
                color: Colors.grey.shade800,
              ),
            )),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: sharedController.currentPageIndex,
              onTap: (value) => sharedController.changeCurrentPage(value),
              showSelectedLabels: false,
              backgroundColor: Colors.black,
              showUnselectedLabels: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  label: "",
                  icon: SvgPicture.asset(
                    sharedController.currentPageIndex == 0 ? SvgSource.homeFilled : SvgSource.homeOutlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: SvgPicture.asset(
                    SvgSource.searchOutlined,
                    width: 26,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: SvgPicture.asset(
                    SvgSource.reels,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: SvgPicture.asset(
                    sharedController.currentPageIndex == 3 ? SvgSource.heartFilled : SvgSource.heartOutlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: FutureBuilder<UserModel>(
                      future: FirebaseAuthMethods().getUserDetails(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            height: 25,
                            width: 25,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: NetworkImage(snapshot.data!.photoUrl!),
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
