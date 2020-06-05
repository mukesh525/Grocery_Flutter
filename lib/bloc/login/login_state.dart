import 'package:meta/meta.dart';

class LoginState  {
  final String email;
  final String password;
  bool loading;

  LoginState({
    @required this.email,
    @required this.password,
    bool loading,
  });

  factory LoginState.initial() {
    return LoginState(
      email: "",
      password: "",
    );
  }

  LoginState copyWith(
      {bool loading,
      String email,
      String password}) {

    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
