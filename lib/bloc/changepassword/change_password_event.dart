abstract class ChangePasswordEvent {}

class CurrentPasswordInput extends ChangePasswordEvent {
  final String currentPassword;
  CurrentPasswordInput({this.currentPassword});
}

class NewPasswordInput extends ChangePasswordEvent {
  final String newPassword;
  NewPasswordInput({this.newPassword});
}

class NewConfirmPasswordInput extends ChangePasswordEvent {
  final String newConfirmPasswordInput;
  NewConfirmPasswordInput({this.newConfirmPasswordInput});
}

class ChangePassword extends ChangePasswordEvent {
  Function callback;
  ChangePassword({this.callback});
}
