import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class myUser {
  String full_name;
  String user_name;
  String email;
  String profile_image;
  myUser({
    this.full_name,
    this.user_name,
    this.email,
    this.profile_image,
  });

  factory myUser.fromJson(Map<String, dynamic> json) {
    return myUser(
      full_name: json['full_name'] as String,
      user_name: json['user_name'] as String,
      email: json['email'] as String,
      profile_image: json['profile_image'] as String,
    );
  }
}
