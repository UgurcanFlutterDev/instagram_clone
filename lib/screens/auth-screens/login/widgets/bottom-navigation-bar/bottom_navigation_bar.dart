import 'package:flutter/material.dart';
import 'package:instagram_clone/services/color_service.dart';

class LoginScreenBottomNavigationBar extends StatelessWidget {
  const LoginScreenBottomNavigationBar({this.buttonText, this.description, this.onTap, super.key});
  final String? description;
  final String? buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(143, 143, 143, 0.7),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              description ?? "",
              style: TextStyle(
                color: ColorService.grayText,
                fontSize: 13,
              ),
            ),
            GestureDetector(
              onTap: onTap ?? () {},
              child: Text(
                buttonText ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
