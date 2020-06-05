import 'package:meta/meta.dart';

class ChangePasswordState {
  bool loading;
  final String currentPassword;
  final String newPassword;
  final String newConfirmPassword;

  ChangePasswordState({
    bool loading,
    @required this.currentPassword,
    @required this.newPassword,
    @required this.newConfirmPassword,
  });

  factory ChangePasswordState.initial() {
    return ChangePasswordState(
        loading: false,
        currentPassword: null,
        newPassword: null,
        newConfirmPassword: null);
  }

  ChangePasswordState copyWith(
      {bool loading,
      String currentPassword,
      String newPassword,
      String newConfirmPassword}) {
    return ChangePasswordState(
        loading: loading ?? this.loading,
        currentPassword: currentPassword ?? this.currentPassword,
        newPassword: newPassword ?? this.newPassword,
        newConfirmPassword: newConfirmPassword ?? this.newConfirmPassword);
  }
}
