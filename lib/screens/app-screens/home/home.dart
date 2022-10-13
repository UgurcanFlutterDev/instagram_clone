import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clone/features/firebase-features/helpers/auth_methods.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Text("Home Screen"),
          ElevatedButton(
            onPressed: () async {
              inspect(await FirebaseAuthMethods().getUserDetails());
              // FirebaseAuth.instance.signOut();
            },
            child: Text("Home Screen"),
          )
        ],
      )),
    );
  }
}
