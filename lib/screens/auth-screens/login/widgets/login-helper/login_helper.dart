import 'package:flutter/material.dart';
import 'package:instagram_clone/services/color_service.dart';

class LoginHelper extends StatelessWidget {
  const LoginHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Did you forget login details ?",
          style: TextStyle(fontSize: 12, color: ColorService.grayText),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            " Get help for login.",
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
