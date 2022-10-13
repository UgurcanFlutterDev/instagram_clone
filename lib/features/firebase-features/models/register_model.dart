class RegisterModel {
  String? userName;
  String? email;
  String? password;
  String? bio;
  String? uid;
  String? photoUrl;

  RegisterModel({this.userName, this.photoUrl, this.email, this.password, this.bio, this.uid});

  RegisterModel.fromJson(Map<String, dynamic> json) {
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
}
