import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userName;
  String? email;
  String? password;
  String? bio;
  String? uid;
  String? photoUrl;

  UserModel({this.userName, this.photoUrl, this.email, this.password, this.bio, this.uid});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    bio = json['bio'];
    photoUrl = json['photoUrl'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['email'] = email;
    data['password'] = password;
    data['bio'] = bio;
    data['photoUrl'] = photoUrl;
    data['uid'] = uid;
    return data;
  }

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      userName: snapshot["userName"],
      bio: snapshot["bio"],
      email: snapshot["email"],
      password: snapshot["password"],
      photoUrl: snapshot["photoUrl"],
      uid: snapshot["uid"],
    );
  }
}
