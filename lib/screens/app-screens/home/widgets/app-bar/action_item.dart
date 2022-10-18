import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppBarActionItem extends StatelessWidget {
  const AppBarActionItem({super.key, required this.icon, this.onTap});
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: Get.width * .04),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
