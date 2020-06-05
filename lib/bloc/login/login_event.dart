abstract class LoginEvent {}

class EmailInput extends LoginEvent {
  final String email;
  EmailInput({this.email});
}

class PasswordInput extends LoginEvent {
  final String password;
  PasswordInput({this.password});
}

class Login extends LoginEvent {
  Function callback;
  Login({this.callback});
}
