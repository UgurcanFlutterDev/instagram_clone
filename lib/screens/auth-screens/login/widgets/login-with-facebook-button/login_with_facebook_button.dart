import 'package:flutter/material.dart';

class LoginWithFacebookButton extends StatelessWidget {
  const LoginWithFacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.facebook,
            color: Color.fromRGBO(55, 151, 239, 1),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "Login with Facebook",
            style: TextStyle(
              color: Color.fromRGBO(55, 151, 239, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
