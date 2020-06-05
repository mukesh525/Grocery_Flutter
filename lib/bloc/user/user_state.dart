import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class UserState {
  final String userId, userName, mobile, email, address;
  final String profilePicture;
  final bool isLogin;

  UserState(
      {@required this.userId,
      @required this.userName,
      @required this.email,
      @required this.mobile,
      @required this.address,
      this.profilePicture,
      @required this.isLogin});

  factory UserState.initial() {
    return UserState(
        userId: null,
        userName: null,
        email: null,
        mobile: null,
        address: null,
        profilePicture: null,
        isLogin: false);
  }

  UserState copyWith(
      {String userId,
      String userName,
      String email,
      String mobile,
      String address,
      String profilePicture,
      bool isLogin}) {
    return UserState(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        address: address ?? this.address,
        profilePicture: profilePicture ?? this.profilePicture,
        isLogin: isLogin ?? this.isLogin);
  }
}
