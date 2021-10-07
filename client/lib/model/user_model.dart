import 'package:flutter/foundation.dart';

@immutable
class User {
  User({
    this.full_name,
    this.user_name,
    this.email,
    this.profile_image,
  });

  User.fromJson(Map<String, Object> json)
      : this(
          full_name: json['full_name'] as String,
          user_name: json['user_name'] as String,
          email: json['email'] as String,
          profile_image: json['profile_image'] as String,
        );

  final String full_name;
  final String user_name;
  final String email;
  final String profile_image;

  Map<String, Object> toJson() {
    return {
      'full_name': full_name,
      'user_name': user_name,
      'email': email,
      'profile_image': profile_image,
    };
  }
}
