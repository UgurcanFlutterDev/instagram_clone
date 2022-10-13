import 'package:flutter/material.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(
            "OR",
            style: TextStyle(
              color: Color.fromARGB(255, 179, 179, 179),
            ),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
